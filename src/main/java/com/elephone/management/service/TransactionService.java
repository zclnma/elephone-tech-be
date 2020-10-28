package com.elephone.management.service;

import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.dispose.exception.TransactionException;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.EnumTransactionStatus;
import com.elephone.management.domain.Store;
import com.elephone.management.domain.Transaction;
import com.elephone.management.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

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

    public Page<Transaction> listByStoreId(UUID storeId, int page, int perPage) {
        return transactionRepository.findByStore_IdOrderByLastModifiedDateDesc(storeId, PageRequest.of(page, perPage));
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

    public Page<Transaction> listTransactions(int page, int pageSize, boolean isFinalised, String transactionNumber, String customerName, String contact) {
        if (transactionNumber != null) {
            return transactionRepository.findAllByIsFinalisedAndTransactionNumberContaining(PageRequest.of(page, pageSize), isFinalised, transactionNumber);
        } else if (customerName != null) {
            return transactionRepository.findAllByIsFinalisedAndCustomerNameContaining(PageRequest.of(page, pageSize), isFinalised, customerName);
        } else if (contact != null) {
            return transactionRepository.findAllByIsFinalisedAndContactContaining(PageRequest.of(page, pageSize), isFinalised, contact);
        } else {
            return transactionRepository.findAllByIsFinalised(PageRequest.of(page, pageSize), isFinalised);
        }
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

        Optional<Transaction> transaction = transactionRepository.findById(id);

        if (transaction.isPresent()) {
            Transaction newTransaction = transaction.get();
            newTransaction.setStatus(status);
            return transactionRepository.save(newTransaction);
        }

        throw new TransactionException("Can't find a valid transaction");
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
        transactionRepository.deleteById(id);
    }

}
