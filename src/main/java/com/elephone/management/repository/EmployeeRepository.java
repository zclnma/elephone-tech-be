package com.elephone.management.repository;

import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, UUID> {
    Page<Employee> findAllByStores(Pageable pageable, Store store);
}
