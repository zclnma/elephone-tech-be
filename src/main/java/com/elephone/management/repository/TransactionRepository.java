package com.elephone.management.repository;


import com.elephone.management.domain.Transaction;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, UUID> {

    Page<Transaction> findByStore_IdOrderByLastModifiedDateDesc (UUID storeId, Pageable pageable);

    Page<Transaction> findAllByOrderByLastModifiedDateDesc (UUID storeId, Pageable pageable);

    Page<Transaction> findAllByIsFinalised(Pageable pageable, boolean isFinalised);

    Page<Transaction> findAllByIsFinalisedAndTransactionNumberContaining(Pageable pageable, boolean isFinalised, String transactionNumber);

    Page<Transaction> findAllByIsFinalisedAndContactContaining(Pageable pageable,boolean isFinalised,String contact);

    Page<Transaction> findAllByIsFinalisedAndCustomerNameContaining(Pageable pageable,boolean isFinalised,String customerName);

}

