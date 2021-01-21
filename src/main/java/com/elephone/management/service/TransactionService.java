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
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class TransactionService {

    private TransactionRepository transactionRepository;
    private StoreService storeService;
    private EmployeeService employeeService;
    private TransactionMapper transactionMapper;
    private EmailService emailService;
    private S3Service s3Service;
    private AuthService authService;

    @Autowired
    public TransactionService(TransactionRepository transactionRepository, StoreService storeService, EmployeeService employeeService, TransactionMapper transactionMapper, S3Service s3Service, EmailService emailService, AuthService authService) {
        this.transactionRepository = transactionRepository;
        this.storeService = storeService;
        this.employeeService = employeeService;
        this.transactionMapper = transactionMapper;
        this.s3Service = s3Service;
        this.emailService = emailService;
        this.authService = authService;
    }

    public Page<Transaction> list(int page, int perPage) {
        return transactionRepository.findAll(PageRequest.of(page, perPage));
    }

    @Transactional
    public Transaction create(CreateTransactionDTO createTransactionDTO) {
        if (createTransactionDTO.getId() != null) {
            throw new TransactionException("Transaction id should be empty");
        }
        int year = LocalDate.now().getYear();
        int month = LocalDate.now().getMonthValue();
        int date = LocalDate.now().getDayOfMonth();
        Store transactionStore = storeService.getStoreById(createTransactionDTO.getStoreId());
        Employee transactionCreatedBy = employeeService.getEmployeeById(createTransactionDTO.getCreatedById());

        Transaction transaction = transactionMapper.fromCreateDTO(createTransactionDTO);
        Integer newStoreReference = transactionStore.getReference() + 1;
        MovePath newPath = MovePath.builder()
                .transaction(transaction)
                .store(transactionStore)
                .build();
        List<MovePath> movePath = new ArrayList<>();
        movePath.add(newPath);
        String reference = String.format("%04d", Integer.parseInt(transactionStore.getSequence())) + year + month + date + String.format("%06d", newStoreReference);
        transaction.setReference(reference);
        transaction.setStore(transactionStore);
        transaction.setInitStore(transactionStore);
        transaction.setMovePath(movePath);
        transaction.setCreatedBy(transactionCreatedBy);
        transaction.setStatus(EnumTransactionStatus.WAIT);
        transactionStore.setReference(newStoreReference);
        Transaction savedTransaction = transactionRepository.saveAndFlush(transaction);
        storeService.updateStore(transactionStore);
        return savedTransaction;
    }

    public Transaction update(UpdateTransactionDTO updateTransactionDTO) {
        Transaction transaction = transactionMapper.fromUpdateDTO(updateTransactionDTO);
        Transaction transactionToUpdate = getTransactionById(updateTransactionDTO.getId());
        transactionToUpdate.setCustomerName(transaction.getCustomerName());
        transactionToUpdate.setContact(transaction.getContact());
        transactionToUpdate.setEmail(transaction.getEmail());
        transactionToUpdate.setDevice(transaction.getDevice());
        transactionToUpdate.setColor(transaction.getColor());
        transactionToUpdate.setImei(transaction.getImei());
        transactionToUpdate.setPasscode(transaction.getPasscode());
        transactionToUpdate.setInspections(transaction.getInspections());
        transactionToUpdate.setBattery(transaction.getBattery());
        transactionToUpdate.setIssue(transaction.getIssue());
        transactionToUpdate.setResolution(transaction.getResolution());
        transactionToUpdate.setAdditionInfo(transaction.getAdditionInfo());
        transactionToUpdate.setProducts(transaction.getProducts());
        transactionToUpdate.setConfSignature(transactionToUpdate.getConfSignature());
        return transactionRepository.save(transactionToUpdate);
    }

    public List<Transaction> createTransactionBatch(List<Transaction> transactions) {
        return transactionRepository.saveAll(transactions);
    }

    public Page<Transaction> listTransactions(int page, int pageSize, EnumTransactionStatus transactionStatus, String reference, String customerName, String contact, String storeId, Boolean hasWarranty) {

        Specification<Transaction> specs = (Root<Transaction> root, CriteriaQuery<?> cq, CriteriaBuilder cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (!StringUtils.isEmpty(storeId)) {
                try {
                    UUID uuidStoreId = UUID.fromString(storeId);
                    Join<Transaction, Store> storeJoin = root.join("store");
                    Predicate predicate = cb.equal(storeJoin.get("id"), uuidStoreId);
                    predicates.add(predicate);
                } catch (Exception ex) {
                    throw new TransactionException("Not a valid storeId");
                }
            }

            if (!StringUtils.isEmpty(reference)) {
                Predicate predicate = cb.like(cb.upper(root.get("reference")), "%" + reference.toUpperCase() + "%");
                predicates.add(predicate);
            }

            if (!StringUtils.isEmpty(customerName)) {
                Predicate predicate = cb.like(cb.function("REPLACE", String.class, cb.upper(root.get("customerName")), cb.literal(" "), cb.literal("")), "%" + customerName.toUpperCase() + "%");
                predicates.add(predicate);
            }

            if (!StringUtils.isEmpty(contact)) {
                Predicate predicate = cb.like(cb.upper(root.get("contact")), "%" + contact.toUpperCase() + "%");
                predicates.add(predicate);
            }

            if (transactionStatus != null) {
                Predicate predicate = cb.equal(root.get("status"), transactionStatus);
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
    public Transaction updateTransactionStatus(UUID id, UUID updatedBy, EnumTransactionStatus status) {
        if (id == null) {
            throw new TransactionException("Transaction id is required");
        }

        Transaction transaction = transactionRepository.findById(id)
                .orElseThrow(() -> new TransactionException("Can't find a valid transaction"));

        boolean isAdmin = authService.getAuthorities().contains("ADMIN");

        if (transaction.getStatus().equals(EnumTransactionStatus.FINALISED)) {
            if (!isAdmin) {
                throw new TransactionException("You don't have permission to modify status of a finalised transaction.");
            }
        }

        if (status.equals(EnumTransactionStatus.FINALISED)) {
            if (StringUtils.isBlank(transaction.getConfSignature())) {
                throw new TransactionException("Please sign the confirmation form before finalising it.");
            }
            Employee employee = employeeService.getEmployeeById(updatedBy);
            transaction.setFinalisedBy(employee);
            transaction.setFinalisedTime(new Date());
            emailService.sendEmail(transaction);
        }

        transaction.setStatus(status);

        return transactionRepository.save(transaction);
    }

    @Transactional
    public Transaction moveTransaction(UUID id, UUID storeId) {
        Store store = storeService.getStoreById(storeId);
        Transaction transaction = getTransactionById(id);
        MovePath newPath = MovePath.builder()
                .transaction(transaction)
                .store(store)
                .build();

        List<MovePath> movePath = transaction.getMovePath();
        movePath.add(newPath);
        transaction.setStore(store);
        return transactionRepository.save(transaction);
    }

    @Transactional
    public void deleteTransactionById(UUID id) {
        if (id == null) {
            throw new TransactionException("Transaction ID is required.");
        }
        transactionRepository.updateDeleteStatus(id);
    }

}
