package com.elephone.management.service;

import com.elephone.management.api.dto.CreateTransactionDTO;
import com.elephone.management.api.mapper.TransactionMapper;
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

    private TransactionRepository transactionRepository;
    private StoreService storeService;
    private EmployeeService employeeService;
    private TransactionMapper transactionMapper;

    @Autowired
    public TransactionService(TransactionRepository transactionRepository, StoreService storeService, EmployeeService employeeService, TransactionMapper transactionMapper) {
        this.transactionRepository = transactionRepository;
        this.storeService = storeService;
        this.employeeService = employeeService;
        this.transactionMapper = transactionMapper;
    }

    public Page<Transaction> list(int page, int perPage) {
        return transactionRepository.findAll(PageRequest.of(page, perPage));
    }

    @Transactional
    public Transaction create(CreateTransactionDTO createTransactionDTO) {
        int year = LocalDate.now().getYear();
        int month = LocalDate.now().getMonthValue();
        int date = LocalDate.now().getDayOfMonth();
        Store transactionStore = storeService.getStoreById(createTransactionDTO.getStoreId());
        Employee transactionCreatedBy = employeeService.getEmployeeById(createTransactionDTO.getCreatedById());

        Transaction transaction = transactionMapper.fromCreateDTO(createTransactionDTO);
        Integer newStoreTransactionNumber = transactionStore.getTransactionNumber() + 1;
        String transactionNumber = transactionStore.getSequence() + year + month + date + String.format("%08d", newStoreTransactionNumber);
        transaction.setTransactionNumber(transactionNumber);
        transaction.setStore(transactionStore);
        transaction.setInitStore(transactionStore);
        transaction.setCreatedBy(transactionCreatedBy);
        transaction.setStatus(EnumTransactionStatus.WAIT);
        transactionStore.setTransactionNumber(newStoreTransactionNumber);
        Transaction savedTransaction = transactionRepository.save(transaction);
        storeService.updateStore(transactionStore);
        return savedTransaction;
    }

    public List<Transaction> createTransactionBatch(List<Transaction> transactions) {
        return transactionRepository.saveAll(transactions);
    }

    public Page<Transaction> listTransactions(int page, int pageSize, EnumTransactionStatus transactionStatus, String transactionNumber, String customerName, String contact, String storeId) {

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

            if (transactionStatus != null) {
                Predicate predicate = cb.equal(root.get("status"), transactionStatus);
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

        if (transaction.getStatus().equals(EnumTransactionStatus.DONE)) {
            throw new TransactionException("Can't change status for a finalised transaction.");
        }

        if (status.equals(EnumTransactionStatus.DONE)) {
            Employee employee = employeeService.getEmployeeById(updatedBy);
            transaction.setFinalisedBy(employee);
            transaction.setFinalisedTime(new Date());
        }

        transaction.setStatus(status);

        return transactionRepository.save(transaction);
    }

    @Transactional
    public Transaction moveTransaction(UUID id, UUID storeId) {
        Store store = storeService.getStoreById(storeId);
        Transaction transaction = getTransactionById(id);

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
