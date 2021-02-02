package com.elephone.management.service;

import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.EnumTransactionStatus;
import com.elephone.management.domain.Store;
import com.elephone.management.domain.Transaction;
import com.elephone.management.repository.EmployeeRepository;
import com.elephone.management.repository.StoreRepository;
import com.elephone.management.repository.TransactionRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import software.amazon.awssdk.services.sesv2.model.AlreadyExistsException;
import software.amazon.awssdk.services.sesv2.model.NotFoundException;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


@Service
public class StoreService {

    private StoreRepository storeRepository;
    private EmployeeRepository employeeRepository;
    private TransactionRepository transactionRepository;
    private SesService sesService;

    @Autowired
    public StoreService(StoreRepository storeRepository, SesService sesService, EmployeeRepository employeeRepository, TransactionRepository transactionRepository) {
        this.storeRepository = storeRepository;
        this.sesService = sesService;
        this.employeeRepository = employeeRepository;
        this.transactionRepository = transactionRepository;
    }

    public void updateEmailIdentity(String oldEmail, String newEmail) {
        if (!StringUtils.equals(oldEmail, newEmail)) {
            try {
                sesService.createEmailIdentity(newEmail);
            } catch (AlreadyExistsException ex) {
            }
            try {
                sesService.deleteEmailIdentity(oldEmail);
            } catch (NotFoundException ex) {

            }
        }
    }

    public Page<Store> listStores(int page, int pageSize, Boolean isDeleted) {
        if (isDeleted == null) {
            return storeRepository.findAll(PageRequest.of(page, pageSize));
        }
        return storeRepository.findAllByIsDeleted(PageRequest.of(page, pageSize), isDeleted);
    }

    public Store createStore(Store store) {
        if (store.getId() != null) {
            throw new StoreException("Do not set store ID when creating store");
        }

        try {
            sesService.createEmailIdentity(store.getEmail());
        } catch (AlreadyExistsException ex) {
        }

        try {
            Store savedStore = storeRepository.save(store);
            return savedStore;
        } catch (Exception ex) {
            throw new StoreException(ex.getMessage());
        }
    }

    public List<Store> createStoreBatch(List<Store> stores) {
        return storeRepository.saveAll(stores);
    }

    public Store getStoreById(UUID id) {
        if (id == null) {
            throw new StoreException("Store ID is required.");
        }

        return storeRepository.findById(id).orElse(null);
    }

    @Transactional
    public Store updateStore(Store store) {
        if (store.getId() == null) {
            throw new StoreException("Store ID is required.");
        }

        Store currentStore = storeRepository.findById(store.getId()).orElseThrow(() -> new StoreException("Store doesn't exist"));
        store.setIsDeleted(currentStore.getIsDeleted());
        store.setReference(currentStore.getReference());
        store.setCreatedDate(currentStore.getCreatedDate());
        updateEmailIdentity(currentStore.getEmail(), store.getEmail());

        return storeRepository.save(store);
    }

    public List<Store> updateAllStore(List<Store> stores) {
        return storeRepository.saveAll(stores);
    }

    @Transactional
    public void deleteStoreById(UUID id) {
        if (id == null) {
            throw new StoreException("Store ID is required.");
        }

        Specification<Transaction> specs = (Root<Transaction> root, CriteriaQuery<?> cq, CriteriaBuilder cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            //Filter transactions which is wait or done.
            CriteriaBuilder.In<EnumTransactionStatus> inClause = cb.in(root.get("status"));
            inClause.value(EnumTransactionStatus.WAIT);
            inClause.value(EnumTransactionStatus.DONE);
            predicates.add(inClause);

            //Filter current store
            Join<Transaction, Store> storeJoin = root.join("store");
            predicates.add(cb.equal(storeJoin.get("id"), id));

            //Filter deleted
            predicates.add(cb.equal(root.get("isDeleted"), false));

            return cb.and(predicates.toArray(new Predicate[predicates.size()]));
        };


        List<Transaction> transactions = transactionRepository.findAll(specs);
        if (transactions.size() > 0) {
            throw new StoreException("Please finalise all transactions in this store before deleting it");
        }

        Store store = getStoreById(id);

        employeeRepository.findAll().forEach(employee -> {
            if (employee.getStores().remove(store)) {
                employeeRepository.save(employee);
            }
        });

        store.setDeletedAt(new Date());
        storeRepository.updateDeleteStatus(true, id);
    }

}
