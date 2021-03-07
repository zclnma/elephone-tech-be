package com.elephone.management.service;

import com.elephone.management.api.dto.CreateTransactionStatusDTO;
import com.elephone.management.dispose.exception.TransactionException;
import com.elephone.management.domain.TransactionStatus;
import com.elephone.management.domain.TransactionStatusGroup;
import com.elephone.management.repository.TransactionStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionStatusService {
    private final TransactionStatusRepository transactionStatusRepository;
    private final TransactionStatusGroupService transactionStatusGroupService;

    @Autowired
    public TransactionStatusService(TransactionStatusRepository transactionStatusRepository, TransactionStatusGroupService transactionStatusGroupService) {
        this.transactionStatusRepository = transactionStatusRepository;
        this.transactionStatusGroupService = transactionStatusGroupService;
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

    public TransactionStatus create(CreateTransactionStatusDTO createTransactionStatusDTO) {
        TransactionStatusGroup transactionStatusGroup = transactionStatusGroupService.getById(createTransactionStatusDTO.getTransactionStatusGroupId());
        TransactionStatus transactionStatus = TransactionStatus.builder()
                .transactionStatusGroup(transactionStatusGroup)
                .key(createTransactionStatusDTO.getKey())
                .displayName(createTransactionStatusDTO.getDisplayName())
                .isDefault(createTransactionStatusDTO.getIsDefault())
                .isActive(true)
                .build();

        return transactionStatusRepository.save(transactionStatus);
    }

    public TransactionStatus update(CreateTransactionStatusDTO createTransactionStatusDTO) {
        TransactionStatusGroup transactionStatusGroup = transactionStatusGroupService.getById(createTransactionStatusDTO.getTransactionStatusGroupId());
        TransactionStatus transactionStatus = TransactionStatus.builder()
                .transactionStatusGroup(transactionStatusGroup)
                .key(createTransactionStatusDTO.getKey())
                .displayName(createTransactionStatusDTO.getDisplayName())
                .isDefault(createTransactionStatusDTO.getIsDefault())
                .isActive(createTransactionStatusDTO.getIsActive())
                .build();
        return transactionStatusRepository.save(transactionStatus);
    }
}
