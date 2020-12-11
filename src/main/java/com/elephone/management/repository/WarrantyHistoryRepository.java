package com.elephone.management.repository;

import com.elephone.management.domain.WarrantyHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface WarrantyHistoryRepository extends JpaRepository<WarrantyHistory, UUID> {
}
