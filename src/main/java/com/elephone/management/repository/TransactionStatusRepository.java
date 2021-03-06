package com.elephone.management.repository;

import com.elephone.management.domain.TransactionStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface TransactionStatusRepository extends JpaRepository<TransactionStatus, UUID>, JpaSpecificationExecutor<TransactionStatus> {

    Optional<TransactionStatus> findByKey(String key);

    Optional<TransactionStatus> findFirstByIsDefault(Boolean isDefault);
}
