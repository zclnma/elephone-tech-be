package com.elephone.management.service;

import com.elephone.management.dispose.exception.TransactionException;
import com.elephone.management.domain.TransactionStatus;
import com.elephone.management.repository.TransactionStatusRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionStatusService {
    private final TransactionStatusRepository transactionStatusRepository;

    public TransactionStatusService(TransactionStatusRepository transactionStatusRepository) {
        this.transactionStatusRepository = transactionStatusRepository;
    }

    public TransactionStatus findByKey(String key) {
        if (key == null) {
            throw new TransactionException("Key can't be null");
        }
        return transactionStatusRepository.findByKey(key).orElseThrow(() -> new TransactionException("Transaction status not found"));
    }

    public TransactionStatus findDefaultStatus() {
        return transactionStatusRepository.findFirstByIsDefault(true).orElseThrow(() -> new TransactionException("No default status found."));
    }

    public List<TransactionStatus> list() {
        return transactionStatusRepository.findAll();
    }
}
