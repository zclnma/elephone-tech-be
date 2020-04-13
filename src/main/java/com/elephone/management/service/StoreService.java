package com.elephone.management.service;

import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Store;
import com.elephone.management.repository.StoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.HashSet;

@Service
public class StoreService {

    private StoreRepository storeRepository;

    @Autowired
    public StoreService(StoreRepository storeRepository) {
        this.storeRepository = storeRepository;
    }

    public Page<Store> listStores(int page, int pageSize) {
        return storeRepository.findAll(PageRequest.of(page, pageSize));
    }

    public Store createStore(Store store) {
        if(store.getId() != null) {
            throw new StoreException("Do not set storeid when creating store");
        }
        store.setIncomes(new HashSet<>());
        store.setWorkingEmployees(new HashSet<>());
        store.setEmployees(new HashSet<>());
        return storeRepository.save(store);
    }
}
