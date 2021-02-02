package com.elephone.management.repository;

import com.elephone.management.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface StoreRepository extends JpaRepository<Store, UUID> {

    Page<Store> findAllByIsDeleted(Pageable pageable, Boolean isDeleted);

    @Modifying
    @Query("update Store store set store.isDeleted = :isDeleted where store.id = :id")
    void updateDeleteStatus(@Param("isDeleted") boolean isDeleted, @Param("id") UUID id);
}
