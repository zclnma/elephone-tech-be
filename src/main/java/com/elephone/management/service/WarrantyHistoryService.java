package com.elephone.management.service;

import com.elephone.management.api.dto.CreateWarrantyHistoryDTO;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import com.elephone.management.domain.Transaction;
import com.elephone.management.domain.WarrantyHistory;
import com.elephone.management.repository.WarrantyHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WarrantyHistoryService {
    private final WarrantyHistoryRepository warrantyHistoryRepository;
    private final EmployeeService employeeService;
    private final StoreService storeService;
    private final TransactionService transactionService;

    @Autowired
    public WarrantyHistoryService(WarrantyHistoryRepository warrantyHistoryRepository, EmployeeService employeeService, StoreService storeService, TransactionService transactionService) {
        this.warrantyHistoryRepository = warrantyHistoryRepository;
        this.employeeService = employeeService;
        this.storeService = storeService;
        this.transactionService = transactionService;
    }

    public WarrantyHistory create(CreateWarrantyHistoryDTO createWarrantyHistoryDTO) {
        Employee employee = employeeService.getEmployeeById(createWarrantyHistoryDTO.getEmployeeId());
        Store store = storeService.getStoreById(createWarrantyHistoryDTO.getStoreId());
        Transaction transaction = transactionService.getTransactionById(createWarrantyHistoryDTO.getTransactionId());

        WarrantyHistory warrantyHistory = WarrantyHistory.builder()
                .employee(employee)
                .store(store)
                .transaction(transaction)
                .description(createWarrantyHistoryDTO.getDescription())
                .build();

        return warrantyHistoryRepository.save(warrantyHistory);
    }
}

