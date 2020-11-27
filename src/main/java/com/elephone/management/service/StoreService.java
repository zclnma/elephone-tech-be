package com.elephone.management.service;

import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Store;
import com.elephone.management.repository.StoreRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import software.amazon.awssdk.services.sesv2.model.AlreadyExistsException;


import java.util.List;
import java.util.UUID;


@Service
public class StoreService {

    private StoreRepository storeRepository;
    private SesService sesService;

    @Autowired
    public StoreService(StoreRepository storeRepository, SesService sesService) {
        this.storeRepository = storeRepository;
        this.sesService = sesService;
    }

    public Page<Store> listStores(int page, int pageSize) {
        return storeRepository.findAllByIsDeleted(PageRequest.of(page, pageSize), false);
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

        if (!StringUtils.equals(store.getEmail(), currentStore.getEmail())) {
            sesService.createEmailIdentity(store.getEmail());
            sesService.deleteEmailIdentity(currentStore.getEmail());
        }

        return storeRepository.save(store);
    }

    @Transactional
    public void deleteStoreById(UUID id) {
        if (id == null) {
            throw new StoreException("Store ID is required.");
        }
        storeRepository.updateDeleteStatus(true, id);
    }

}
