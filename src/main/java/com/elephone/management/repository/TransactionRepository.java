package com.elephone.management.repository;


import com.elephone.management.domain.Store;
import com.elephone.management.domain.Transaction;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, UUID>, JpaSpecificationExecutor<Transaction> {

    @Modifying
    @Query("update Transaction t set t.isDeleted = true where t.id = :id")
    void updateDeleteStatus(@Param("id") UUID id);

    List<Transaction> findAllByStore_Id(UUID storeId);
}

