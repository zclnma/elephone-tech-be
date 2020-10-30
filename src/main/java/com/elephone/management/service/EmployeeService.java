package com.elephone.management.service;

import com.elephone.management.dispose.exception.EmployeeException;
import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import com.elephone.management.repository.EmployeeRepository;
import com.elephone.management.repository.StoreRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class EmployeeService {

    private EmployeeRepository employeeRepository;
    private StoreRepository storeRepository;

    @Autowired
    public EmployeeService(EmployeeRepository employeeRepository, StoreRepository storeRepository) {
        this.employeeRepository = employeeRepository;
        this.storeRepository = storeRepository;
    }

    public Page<Employee> listEmployees(int page, int pageSize) {
        return employeeRepository.findAll(PageRequest.of(page, pageSize));
    }

    public Page<Employee> listEmployees(int page, int pageSize, String storeId) {
        if (StringUtils.isEmpty(storeId)) {
            return employeeRepository.findAll(PageRequest.of(page, pageSize));
        }
        UUID uuid = UUID.fromString(storeId);
        Store store = storeRepository.findById(uuid).orElse(null);
        if (store == null) {
            throw new StoreException("Can't find store with id: " + storeId);
        }
        return employeeRepository.findAllByStores(PageRequest.of(page, pageSize), store);
    }

    public Employee getEmployeeById(UUID id) {
        if (id == null) {
            throw new EmployeeException("Employee Id is required.");
        }
        return employeeRepository.findById(id).orElse(null);
    }

    public Employee createEmployee(Employee employee) {
        if (employee.getId() != null) {
            throw new EmployeeException("Do not set Employee Id when creating employee.");
        }
        return employeeRepository.save(employee);
    }

    public List<Employee> createEmployeeBatch(List<Employee> employees) {
        return employeeRepository.saveAll(employees);
    }

    @Transactional
    public Employee updateEmployee(Employee employee) {
        if (employee.getId() == null) {
            throw new EmployeeException("Employee Id is required.");
        }

        if (employee.getStores() == null) {
            return employeeRepository.save(employee);
        }

        List<Store> stores = storeRepository.findAllById(employee.getStores().stream().map(Store::getId).collect(Collectors.toList()));
        stores.forEach(store -> {
            if(!store.getEmployees().remove(employee)) {
                store.getEmployees().add(employee);
            }
        });
        storeRepository.saveAll(stores);
        storeRepository.flush();
        return employeeRepository.save(employee);
    }

    @Transactional
    public void deleteEmployeeById(UUID id) {
        if (id == null) {
            throw new EmployeeException("Employee Id is required.");
        }

        employeeRepository.deleteById(id);
    }

}
