package com.elephone.management.repository;

import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, UUID> {

    Optional<Employee> findByCognitoId(UUID id);

    Page<Employee> findAllByStores(Pageable pageable, Store store);

    @Modifying
    @Query("update Employee e set e.isDeleted = :isDeleted where e.id = :id")
    Employee updateDeleteStatus (@Param("isDeleted") boolean isDeleted, @Param("id") UUID id);

    @Modifying
    @Query("update Employee e set e.isActive = :isActive where e.id = :id")
    Employee updateActiveStatus (@Param("isActive") boolean isActive, @Param("id") UUID id);
}
