package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionDTO;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import com.elephone.management.domain.Transaction;
import org.springframework.stereotype.Component;

@Component
public class TransactionDTOMapper {

    public TransactionDTO toDTO(Transaction transaction) {
        if (transaction == null) {
            return null;
        }

        TransactionDTO transactionDTO = new TransactionDTO();
        transactionDTO.setColor(transaction.getColor());
        transactionDTO.setInspection(transaction.getInspection());
        transactionDTO.setCondition(transaction.getCondition());
        transactionDTO.setContact(transaction.getContact());
        transactionDTO.setCustomerName(transaction.getCustomerName());
        transactionDTO.setDevice(transaction.getDevice());
        transactionDTO.setCreatedBy(transaction.getCreatedBy().getId());
        transactionDTO.setFinalisedBy(transaction.getFinalisedBy().getId());
        transactionDTO.setIsFinalised(transaction.getIsFinalised());
        transactionDTO.setId(transaction.getId());
        transactionDTO.setImei(transaction.getImei());
        transactionDTO.setIssue(transaction.getIssue());
        transactionDTO.setPickupTime(transaction.getPickupTime());
        transactionDTO.setResolution(transaction.getResolution());
        transactionDTO.setStatus(transaction.getStatus());
        transactionDTO.setStoreId(transaction.getStore().getId());
        transactionDTO.setTransactionNumber(transaction.getTransactionNumber());

        return transactionDTO;
    }

    public Transaction fromDTO(TransactionDTO transactionDTO) {

        if (transactionDTO == null) {
            return null;
        };

        Transaction transaction = new Transaction();
        transaction.setColor(transactionDTO.getColor());

        transaction.setCondition(transactionDTO.getCondition());
        transaction.setContact(transactionDTO.getContact());
        transaction.setCustomerName(transactionDTO.getCustomerName());
        transaction.setDevice(transactionDTO.getDevice());
        transaction.setId(transactionDTO.getId());
        transaction.setImei(transactionDTO.getImei());
        transaction.setIssue(transactionDTO.getIssue());
        transaction.setPickupTime(transactionDTO.getPickupTime());
        transaction.setResolution(transactionDTO.getResolution());
        transaction.setTransactionNumber(transactionDTO.getTransactionNumber());
        if(transactionDTO.getIsFinalised() != null) {
            transaction.setIsFinalised(transactionDTO.getIsFinalised());
        }
        if(transactionDTO.getStatus() != null) {
            transaction.setStatus(transactionDTO.getStatus());
        }
        if(transactionDTO.getInspection() != null) {
            transaction.setInspection(transactionDTO.getInspection());
        }
        if(transactionDTO.getStoreId() != null) {
            transaction.setStore(Store.builder().id(transactionDTO.getStoreId()).build());
        }
        if(transactionDTO.getCreatedBy() != null) {
            transaction.setCreatedBy(Employee.builder().id(transactionDTO.getCreatedBy()).build());
        }
        if(transactionDTO.getFinalisedBy() != null) {
            transaction.setCreatedBy(Employee.builder().id(transactionDTO.getFinalisedBy()).build());
        }

        return transaction;
    }

}
