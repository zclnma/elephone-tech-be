package com.elephone.management.repository;


import com.elephone.management.domain.Transaction;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, UUID> {

    Page<Transaction> findAllByStore_IdOrderByLastModifiedDateDesc(UUID storeId, Pageable pageable);

    Page<Transaction> findAllByStore_IdAndIsFinalisedOrderByLastModifiedDate(Pageable pageable, UUID storeId, boolean isFinalised);

    Page<Transaction> findAllByStore_IdAndIsFinalisedAndTransactionNumberContainingOrderByLastModifiedDate(Pageable pageable, UUID storeId, boolean isFinalised, String transactionNumber);

    Page<Transaction> findAllByStore_IdAndIsFinalisedAndContactContainingOrderByLastModifiedDate(Pageable pageable, UUID storeId, boolean isFinalised, String contact);

    Page<Transaction> findAllByStore_IdAndIsFinalisedAndCustomerNameContainingOrderByLastModifiedDate(Pageable pageable, UUID storeId, boolean isFinalised, String customerName);

    Page<Transaction> findAllByIsFinalisedOrderByLastModifiedDate(Pageable pageable, boolean isFinalised);

    Page<Transaction> findAllByIsFinalisedAndTransactionNumberContainingOrderByLastModifiedDate(Pageable pageable, boolean isFinalised, String transactionNumber);

    Page<Transaction> findAllByIsFinalisedAndContactContainingOrderByLastModifiedDate(Pageable pageable, boolean isFinalised, String contact);

    Page<Transaction> findAllByIsFinalisedAndCustomerNameContainingOrderByLastModifiedDate(Pageable pageable, boolean isFinalised, String customerName);

}

