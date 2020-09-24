package com.elephone.management.service;

import com.elephone.management.dispose.exception.EmployeeException;
import com.elephone.management.domain.Employee;
import com.elephone.management.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
public class EmployeeService {

    private EmployeeRepository employeeRepository;

    @Autowired
    public EmployeeService (EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public Page<Employee> listEmployees (int page, int pageSize) {
        return employeeRepository.findAll(PageRequest.of(page, pageSize));
    }

    public Employee getEmployeeById (UUID id) {
        if(id == null) {
            throw new EmployeeException("Employee Id is required.");
        }
        return employeeRepository.findById(id).orElse(null);
    }

    public Employee createEmployee (Employee employee) {
        if(employee.getId() != null) {
            throw new EmployeeException("Do not set Employee Id when creating employee.");
        }
        return employeeRepository.save(employee);
    }

    public List<Employee> createEmployeeBatch (List<Employee> employees) {
        return employeeRepository.saveAll(employees);
    }

    @Transactional
    public Employee updateEmployee (Employee employee) {
        if(employee.getId() == null) {
            throw new EmployeeException("Employee Id is required.");
        }

        return employeeRepository.save(employee);
    }

    @Transactional
    public void deleteEmployeeById (UUID id) {
        if(id == null) {
            throw new EmployeeException("Employee Id is required.");
        }

        employeeRepository.deleteById(id);
    }

}
