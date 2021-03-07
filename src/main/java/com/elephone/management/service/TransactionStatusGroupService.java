package com.elephone.management.service;

import com.elephone.management.dispose.exception.TransactionException;
import com.elephone.management.domain.TransactionStatusGroup;
import com.elephone.management.repository.TransactionStatusGroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class TransactionStatusGroupService {
    private final TransactionStatusGroupRepository transactionStatusGroupRepository;

    @Autowired
    public TransactionStatusGroupService(TransactionStatusGroupRepository transactionStatusGroupRepository) {
        this.transactionStatusGroupRepository = transactionStatusGroupRepository;
    }

    public List<TransactionStatusGroup> list() {
        return transactionStatusGroupRepository.findAll();
    }

    public TransactionStatusGroup getById(UUID id) {
        return transactionStatusGroupRepository.findById(id).orElseThrow(() -> new TransactionException("Transaction status group not found."));
    }

    public TransactionStatusGroup create(TransactionStatusGroup transactionStatusGroup) {
        transactionStatusGroup.setIsActive(true);
        return transactionStatusGroupRepository.save(transactionStatusGroup);
    }

    public TransactionStatusGroup update(TransactionStatusGroup transactionStatusGroup) {
        Optional<TransactionStatusGroup> tsg = transactionStatusGroupRepository.findByGroupOrder(transactionStatusGroup.getGroupOrder());
        if (tsg.isEmpty()) {
            return transactionStatusGroupRepository.save(transactionStatusGroup);
        }
        throw new TransactionException("You already have a transaction group which has order " + transactionStatusGroup.getGroupOrder());
    }

    public Integer getMaxGroupOrder() {
        return transactionStatusGroupRepository.getMaxGroupOrder();
    }
}
