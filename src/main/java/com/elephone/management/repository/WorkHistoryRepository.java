package com.elephone.management.repository;

import com.elephone.management.domain.WorkHistory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface WorkHistoryRepository extends JpaRepository<WorkHistory, UUID> {

    Page<WorkHistory> findByEmployee_IdOrderByCreatedDateDesc(UUID employeeId, Pageable pageable);

    Page<WorkHistory> findAllByOrderByCreatedDateDesc (Pageable pageable);

    WorkHistory findFirstByEmployee_IdAndFinishIsNull(UUID employeeId);
}
