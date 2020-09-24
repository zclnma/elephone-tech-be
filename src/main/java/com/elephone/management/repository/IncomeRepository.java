package com.elephone.management.repository;

import com.elephone.management.domain.Income;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface IncomeRepository extends JpaRepository<Income, UUID> {
    Page<Income> findByStore_IdOrderByCreatedDateDesc(UUID storeId, Pageable pageable);

    Page<Income> findAllByOrderByCreatedDateDesc(Pageable pageable);
}
