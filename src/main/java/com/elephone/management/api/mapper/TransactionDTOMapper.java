package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.api.dto.TransactionDTO;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import com.elephone.management.domain.Transaction;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.stream.Collectors;

@Component
public class TransactionDTOMapper {

    public TransactionDTO toDTO(Transaction transaction) {
        CommentDTOMapper commentDTOMapper = new CommentDTOMapper();
        if (transaction == null) {
            return null;
        }

        return TransactionDTO.builder()
                .id(transaction.getId())
                .color(transaction.getColor())
                .inspection(transaction.getInspection())
                .condition(transaction.getCondition())
                .contact(transaction.getContact())
                .comments(transaction.getComments().stream().map(commentDTOMapper::toDTO).collect(Collectors.toList()))
                .customerName(transaction.getCustomerName())
                .device(transaction.getDevice())
                .isFinalised(transaction.getIsFinalised())
                .createdBy(transaction.getCreatedBy() == null ? null : transaction.getCreatedBy().getId())
                .finalisedBy(transaction.getFinalisedBy() == null ? null : transaction.getFinalisedBy().getId())
                .imei(transaction.getImei())
                .issue(transaction.getIssue())
                .pickupTime(transaction.getPickupTime())
                .resolution(transaction.getResolution())
                .status(transaction.getStatus())
                .transactionNumber(transaction.getTransactionNumber())
                .storeId(transaction.getStore() == null ? null : transaction.getStore().getId())
                .build();
    }

    public Transaction fromDTO(TransactionDTO transactionDTO) {

        if (transactionDTO == null) {
            return null;
        }
        ;

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
        if (transactionDTO.getIsFinalised() != null) {
            transaction.setIsFinalised(transactionDTO.getIsFinalised());
        }
        if (transactionDTO.getStatus() != null) {
            transaction.setStatus(transactionDTO.getStatus());
        }
        if (transactionDTO.getInspection() != null) {
            transaction.setInspection(transactionDTO.getInspection());
        }
        if (transactionDTO.getStoreId() != null) {
            transaction.setStore(Store.builder().id(transactionDTO.getStoreId()).build());
        }
        if (transactionDTO.getCreatedBy() != null) {
            transaction.setCreatedBy(Employee.builder().id(transactionDTO.getCreatedBy()).build());
        }
        if (transactionDTO.getFinalisedBy() != null) {
            transaction.setCreatedBy(Employee.builder().id(transactionDTO.getFinalisedBy()).build());
        }

        return transaction;
    }

}
