package com.elephone.management.service;

import com.elephone.management.api.dto.CreateTransactionDTO;
import com.elephone.management.api.dto.UpdateTransactionDTO;
import com.elephone.management.api.mapper.TransactionMapper;
import com.elephone.management.dispose.exception.TransactionException;
import com.elephone.management.domain.*;
import com.elephone.management.repository.TransactionRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class TransactionService {

    private final TransactionMapper transactionMapper;
    private final TransactionRepository transactionRepository;
    private final TransactionStatusService transactionStatusService;
    private final TransactionStatusGroupService transactionStatusGroupService;
    private final StoreService storeService;
    private final EmployeeService employeeService;
    private final EmailService emailService;
    private final AuthService authService;
    private final PdfService pdfService;
    private final TemplateService templateService;

    @Autowired
    public TransactionService(TransactionMapper transactionMapper, TransactionRepository transactionRepository, TransactionStatusService transactionStatusService, TransactionStatusGroupService transactionStatusGroupService, StoreService storeService, EmployeeService employeeService, EmailService emailService, AuthService authService, PdfService pdfService, TemplateService templateService) {
        this.transactionMapper = transactionMapper;
        this.transactionRepository = transactionRepository;
        this.transactionStatusService = transactionStatusService;
        this.transactionStatusGroupService = transactionStatusGroupService;
        this.storeService = storeService;
        this.employeeService = employeeService;
        this.emailService = emailService;
        this.authService = authService;
        this.pdfService = pdfService;
        this.templateService = templateService;
    }

    public Page<Transaction> list(int page, int perPage) {
        return transactionRepository.findAll(PageRequest.of(page, perPage));
    }

    @Transactional
    public Transaction create(CreateTransactionDTO createTransactionDTO) {
        if (createTransactionDTO.getId() != null) {
            throw new TransactionException("Transaction id should be empty");
        }
        ZoneId zoneId = ZoneId.of("Australia/Sydney");
        String year = String.format("%04d", LocalDate.now(zoneId).getYear());
        String month = String.format("%02d", LocalDate.now(zoneId).getMonthValue());
        String date = String.format("%02d", LocalDate.now(zoneId).getDayOfMonth());

        // The actual transaction
        Transaction transaction = transactionMapper.fromCreateDTO(createTransactionDTO);

        // Find the store object where this transaction is created
        Store transactionStore = storeService.getStoreById(createTransactionDTO.getStoreId());

        // Find the employee object for whom created this transaction.
        Employee transactionCreatedBy = employeeService.getEmployeeById(createTransactionDTO.getCreatedById());

        // Generate the new reference to store in the store
        Integer newStoreReference = transactionStore.getReference() + 1;

        // Generate the reference numbe for transaction
        String reference = String.format("%04d", Integer.parseInt(transactionStore.getSequence())) + year + month + date + String.format("%06d", newStoreReference);

        // Add bi-directional reference for each transaction product
        transaction.getProducts().forEach(transactionProduct -> transactionProduct.setTransaction(transaction));

        // Created the first transition (store that transaction is created)
        TransactionTransition transactionTransition = TransactionTransition.builder()
                .transaction(transaction)
                .store(transactionStore)
                .build();

        // Find the default transaction status
        TransactionStatus defaultStatus = transactionStatusService.findDefaultStatus();

        // Created the first action (RECEIVED)
        TransactionAction transactionAction = TransactionAction.builder()
                .transaction(transaction)
                .performedBy(transactionCreatedBy)
                .transactionStatus(defaultStatus)
                .build();

        transaction.addTransactionTransition(transactionTransition);
        transaction.addTransactionAction(transactionAction);
        transaction.setReference(reference);
        transaction.setStore(transactionStore);
        transaction.setInitStore(transactionStore);
        transaction.setCreatedBy(transactionCreatedBy);
        transaction.setTransactionStatus(defaultStatus);
        transaction.getCustomer().setTransaction(transaction);
        transaction.getDevice().setTransaction(transaction);
        transactionStore.setReference(newStoreReference);
        Transaction savedTransaction = transactionRepository.save(transaction);
        storeService.updateStore(transactionStore);
        if (!StringUtils.isEmpty(savedTransaction.getCustomer().getEmail())) {
            emailService.sendEmail(savedTransaction, "authorisation");
        }
        return savedTransaction;
    }

    @Transactional
    public Transaction update(UpdateTransactionDTO updateTransactionDTO) {
        Transaction transaction = transactionMapper.fromUpdateDTO(updateTransactionDTO);
        Transaction transactionToUpdate = getTransactionById(updateTransactionDTO.getId());
        transactionToUpdate.getCustomer().setName(transaction.getCustomer().getName());
        transactionToUpdate.getCustomer().setContact(transaction.getCustomer().getContact());
        transactionToUpdate.getCustomer().setEmail(transaction.getCustomer().getEmail());
        transactionToUpdate.getDevice().setName(transaction.getDevice().getName());
        transactionToUpdate.getDevice().setColor(transaction.getDevice().getColor());
        transactionToUpdate.getDevice().setImei(transaction.getDevice().getImei());
        transactionToUpdate.getDevice().setPasscode(transaction.getDevice().getPasscode());
        transactionToUpdate.setDeposit(transaction.getDeposit());
        transactionToUpdate.setFinalInspections(transaction.getFinalInspections());
        transactionToUpdate.setBattery(transaction.getBattery());
        transactionToUpdate.setIssue(transaction.getIssue());
        transactionToUpdate.setResolution(transaction.getResolution());
        transactionToUpdate.setAdditionInfo(transaction.getAdditionInfo());
        transactionToUpdate.getProducts().clear();
        transactionToUpdate.getProducts().addAll(transaction.getProducts());
        transactionToUpdate.setConfSignature(transaction.getConfSignature());
        return transactionRepository.save(transactionToUpdate);
    }

    public Page<Transaction> listTransactions(int page, int pageSize, String reference, String customerName, String contact, String storeId, Boolean hasWarranty, Boolean showCreatedAt, String status, String statusGroup) {
        Specification<Transaction> specs = (Root<Transaction> root, CriteriaQuery<?> cq, CriteriaBuilder cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (!StringUtils.isEmpty(storeId)) {
                try {
                    UUID uuidStoreId = UUID.fromString(storeId);
                    Join<Transaction, Store> storeJoin = root.join("store");
                    Join<Transaction, Store> initStoreJoin = root.join("initStore");
                    if (showCreatedAt == null) {
                        Predicate predicate = cb.equal(storeJoin.get("id"), uuidStoreId);
                        predicates.add(predicate);
                    } else {
                        Predicate predicate1 = cb.equal(initStoreJoin.get("id"), uuidStoreId);
                        Predicate predicate2 = cb.notEqual(storeJoin.get("id"), uuidStoreId);
                        predicates.add(predicate1);
                        predicates.add(predicate2);
                    }
                } catch (Exception ex) {
                    throw new TransactionException("Not a valid storeId");
                }
            }

            if (!StringUtils.isEmpty(reference)) {
                Predicate predicate = cb.like(cb.upper(root.get("reference")), "%" + reference.toUpperCase() + "%");
                predicates.add(predicate);
            }

            if (!StringUtils.isEmpty(customerName)) {
                Predicate predicate = cb.like(cb.function("REPLACE", String.class, cb.upper(root.get("customer").get("name")), cb.literal(" "), cb.literal("")), "%" + customerName.toUpperCase() + "%");
                predicates.add(predicate);
            }

            if (!StringUtils.isEmpty(contact)) {
                Predicate predicate = cb.like(cb.upper(root.get("customer").get("contact")), "%" + contact.toUpperCase() + "%");
                predicates.add(predicate);
            }

            if (statusGroup != null) {
                Join<Transaction, TransactionStatus> transactionStatusJoin = root.join("transactionStatus");
                Join<TransactionStatusGroup, TransactionStatus> transactionStatusGroupJoin = transactionStatusJoin.join("transactionStatusGroup");
                Predicate predicate = cb.equal(transactionStatusGroupJoin.get("key"), statusGroup);
                predicates.add(predicate);
            } else if (status != null) {
                Join<Transaction, TransactionStatus> transactionStatusJoin = root.join("transactionStatus");
                Predicate predicate = cb.equal(transactionStatusJoin.get("key"), status);
                predicates.add(predicate);
            }

            if (hasWarranty != null) {
                Predicate predicate;
                if (hasWarranty) {
                    predicate = cb.greaterThan(cb.size(root.get("warrantyHistories")), 0);
                } else {
                    predicate = cb.equal(cb.size(root.get("warrantyHistories")), 0);
                }
                predicates.add(predicate);
            }

            predicates.add(cb.equal(root.get("isDeleted"), false));

            return cb.and(predicates.toArray(new Predicate[predicates.size()]));
        };

        Pageable pageable = PageRequest.of(page, pageSize, Sort.by("lastModifiedDate").descending());

        return transactionRepository.findAll(specs, pageable);

    }

    public Transaction getTransactionById(UUID id) {
        if (id == null) {
            throw new TransactionException("Transaction id is required");
        }
        return transactionRepository.findById(id).orElse(null);
    }

    @Transactional
    public Transaction updateTransactionStatus(UUID id, UUID updatedBy, String status) {
        if (id == null) {
            throw new TransactionException("Transaction id is required");
        }

        // Find the max order defined in the transaction status group
        Integer maxOrder = transactionStatusGroupService.getMaxGroupOrder();

        // Find the transaction to be updated
        Transaction transaction = getTransactionById(id);

        // Find the transaction status to be updated
        TransactionStatus newTransactionStatus = transactionStatusService.findByKey(status);

        // Find the employee that performs the action
        Employee employee = employeeService.getEmployeeById(updatedBy);

        // Check if current user is admin
        boolean isAdmin = authService.getAuthorities().contains("ADMIN");

        // Get the old status group order
        int groupOrder = transaction.getTransactionStatus().getTransactionStatusGroup().getGroupOrder();

        // Get the new status group order
        int newGroupOrder = newTransactionStatus.getTransactionStatusGroup().getGroupOrder();

        // If moving the status back one level, need admin permission
        if (newGroupOrder < groupOrder && !isAdmin) {
            throw new TransactionException("You don't have permission to perform the action. Please refer to an admin user or contact administrator");
        }

        // If moving from finalised status to previous status, reset confirmation signature
        if (newGroupOrder != maxOrder && groupOrder == maxOrder) {
            transaction.setConfSignature(null);
            transaction.setFinalisedBy(null);
            transaction.setFinalisedTime(null);
        }


        // If moving to finalised status, try finalising it
        if (newGroupOrder == maxOrder && groupOrder != maxOrder) {
            if (StringUtils.isBlank(transaction.getConfSignature())) {
                throw new TransactionException("Please sign the confirmation form before finalising it.");
            }
            transaction.setFinalisedBy(employee);
            transaction.setFinalisedTime(LocalDateTime.now());
            if (!StringUtils.isEmpty(transaction.getCustomer().getEmail())) {
                emailService.sendEmail(transaction, "confirmation");
            }
        }

        // No error, then add a new transaction action entry
        TransactionAction transactionAction = TransactionAction.builder()
                .performedBy(employee)
                .transaction(transaction)
                .transactionStatus(newTransactionStatus)
                .build();

        transaction.setTransactionStatus(newTransactionStatus);
        transaction.addTransactionAction(transactionAction);
        return transactionRepository.save(transaction);
    }

    @Transactional
    public Transaction moveTransaction(UUID id, UUID storeId) {
        Store store = storeService.getStoreById(storeId);
        Transaction transaction = getTransactionById(id);
        TransactionTransition newTransition = TransactionTransition.builder()
                .transaction(transaction)
                .store(store)
                .build();

        transaction.setStore(store);
        transaction.addTransactionTransition(newTransition);
        return transactionRepository.save(transaction);
    }

    @Transactional
    public void deleteTransactionById(UUID id) {
        if (id == null) {
            throw new TransactionException("Transaction ID is required.");
        }
        transactionRepository.updateDeleteStatus(id);
    }

    public byte[] getTransactionPdfByte(UUID id, String type) throws IOException {
        Transaction transaction = getTransactionById(id);
        Integer maxOrder = transactionStatusGroupService.getMaxGroupOrder();
        //If type != authorisation && transaction is not finalised, throw error
        if ("confirmation".equalsIgnoreCase(type) && transaction.getTransactionStatus().getTransactionStatusGroup().getGroupOrder() != maxOrder) {
            throw new TransactionException("Please finalise the transaction before downloading it.");
        }

        String pdfHtml = templateService.generatePdfString(transaction, type);
        return pdfService.generatePdfByte(pdfHtml);
    }
}
