package com.elephone.management.service;

import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.dispose.exception.TransactionException;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.EnumTransactionStatus;
import com.elephone.management.domain.Store;
import com.elephone.management.domain.Transaction;
import com.elephone.management.repository.TransactionRepository;
import com.elephone.management.repository.specification.TransactionSpecification;
import com.elephone.management.repository.specification.TransactionSpecificationBuilder;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import software.amazon.awssdk.services.cognitoidentity.CognitoIdentityClient;
import software.amazon.awssdk.services.cognitoidentity.model.ListIdentitiesRequest;
import software.amazon.awssdk.services.cognitoidentityprovider.CognitoIdentityProviderClient;
import software.amazon.awssdk.services.cognitoidentityprovider.model.AdminCreateUserRequest;
import software.amazon.awssdk.services.cognitoidentityprovider.model.ListUserPoolsRequest;
import software.amazon.awssdk.services.cognitoidentityprovider.model.ListUserPoolsResponse;

import javax.persistence.criteria.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.util.*;

@Service
public class TransactionService {
    private final String ADMIN_INDEX = "00";
    private int transactionNumber = 0;

    private TransactionRepository transactionRepository;
    private StoreService storeService;
    private EmployeeService employeeService;

    @Autowired
    public TransactionService(TransactionRepository transactionRepository, StoreService storeService, EmployeeService employeeService) {
        this.transactionRepository = transactionRepository;
        this.storeService = storeService;
        this.employeeService = employeeService;
    }

    @Scheduled(cron = "0 0 0 * * ?")
    public void resetTransactionNumber() {
        transactionNumber = 0;
    }

    public Page<Transaction> list(int page, int perPage) {
        return transactionRepository.findAll(PageRequest.of(page, perPage));
    }

    public Transaction create(Transaction transaction) {
        String transactionNumber;
        int year = LocalDate.now().getYear();
        int month = LocalDate.now().getMonthValue();
        int date = LocalDate.now().getDayOfMonth();
        Store store = transaction.getStore();
        if (store == null) {
            transactionNumber = ADMIN_INDEX + year + month + date + String.format("%04d", this.transactionNumber++);
        } else {
            Store dbStore = storeService.getStoreById(store.getId());
            if (dbStore == null) {
                transactionNumber = ADMIN_INDEX + year + month + date + String.format("%04d", this.transactionNumber++);
            } else {
                String storeSequence = store.getSequence();
                transactionNumber = storeSequence + year + month + date + String.format("%04d", this.transactionNumber++);
            }
        }

        transaction.setTransactionNumber(transactionNumber);

        return transactionRepository.save(transaction);
    }

    public List<Transaction> createTransactionBatch(List<Transaction> transactions) {
        return transactionRepository.saveAll(transactions);
    }

    public Page<Transaction> listTransactions(int page, int pageSize, Boolean isFinalised, String transactionNumber, String customerName, String contact, String storeId) {

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

            if (!StringUtils.isEmpty(transactionNumber)) {
                Predicate predicate = cb.like(cb.upper(root.get("transactionNumber")), "%" + transactionNumber.toUpperCase() + "%");
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

            if (isFinalised != null) {
                Predicate predicate = cb.equal(root.get("isFinalised"), isFinalised);
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
    public Transaction updateTransactionStatus(UUID id, EnumTransactionStatus status) {
        if (id == null) {
            throw new TransactionException("Transaction id is required");
        }

        Transaction transaction = transactionRepository.findById(id)
                .orElseThrow(() -> new TransactionException("Can't find a valid transaction"));

        if (status == EnumTransactionStatus.SENT) {
            transaction.setSendTime(new Date());
        } else if (status == EnumTransactionStatus.DONE) {
            if (transaction.getStatus() == EnumTransactionStatus.WAIT) {
                throw new TransactionException("Please update status to " + EnumTransactionStatus.WAIT.getDisplayName() + " first");
            }
            transaction.setDoneTime(new Date());
        }

        transaction.setStatus(status);

        return transactionRepository.save(transaction);
    }

    @Transactional
    public Transaction finaliseTransaction(@NotNull UUID transactionId, @NotNull UUID employeeId) {

        Employee employee = employeeService.getEmployeeById(employeeId);
        Optional<Transaction> transaction = transactionRepository.findById(transactionId);

        if (transaction.isPresent()) {
            Transaction newTransaction = transaction.get();
            newTransaction.setIsFinalised(true);
            newTransaction.setFinalisedBy(employee);
            return transactionRepository.save(newTransaction);
        }

        throw new TransactionException("Can't find a valid transaction");
    }

    @Transactional
    public void deleteTransactionById(UUID id) {
        if (id == null) {
            throw new TransactionException("Transaction ID is required.");
        }
        transactionRepository.updateDeleteStatus(id);
    }

}
