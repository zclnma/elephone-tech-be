package com.elephone.management.repository;

import com.elephone.management.domain.TransactionStatusGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface TransactionStatusGroupRepository extends JpaRepository<TransactionStatusGroup, UUID>, JpaSpecificationExecutor<TransactionStatusGroup> {

    @Query(value = "select max(groupOrder) from TransactionStatusGroup")
    Integer getMaxGroupOrder();

    Optional<TransactionStatusGroup> findByGroupOrder(int groupOrder);

    @Modifying
    @Query("update TransactionStatusGroup tsg set tsg.isActive = :isActive where tsg.id = :id")
    void updateActiveStatus(@Param("isActive") boolean isActive, @Param("id") UUID id);
}