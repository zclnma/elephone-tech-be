package com.elephone.management.service;

import com.elephone.management.repository.TransactionStatusGroupRepository;
import org.springframework.stereotype.Service;

@Service
public class TransactionStatusGroupService {
    private final TransactionStatusGroupRepository transactionStatusGroupRepository;

    public TransactionStatusGroupService(TransactionStatusGroupRepository transactionStatusGroupRepository) {
        this.transactionStatusGroupRepository = transactionStatusGroupRepository;
    }

    public Integer getMaxGroupOrder() {
        return transactionStatusGroupRepository.getMaxGroupOrder();
    }
}
