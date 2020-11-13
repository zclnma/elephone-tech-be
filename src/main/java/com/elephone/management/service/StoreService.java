package com.elephone.management.service;

import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Store;
import com.elephone.management.repository.StoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

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
        if (store.getId() != null) {
            throw new StoreException("Do not set store ID when creating store");
        }
        return storeRepository.save(store);
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
        return storeRepository.save(store);
    }

    @Transactional
    public void deleteStoreById(UUID id) {
        if (id == null) {
            throw new StoreException("Store ID is required.");
        }
        storeRepository.updateDeleteStatus(true,id);
    }

}
