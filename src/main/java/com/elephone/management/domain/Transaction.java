package com.elephone.management.domain;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
@EntityListeners(AuditingEntityListener.class)
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @OneToOne(cascade = {
            CascadeType.MERGE,
            CascadeType.PERSIST
    }, mappedBy = "transaction")
    private Customer customer;

    @OneToOne(cascade = {
            CascadeType.MERGE,
            CascadeType.PERSIST
    }, mappedBy = "transaction")
    private Device device;

    @Column
    private String battery;

    @Column(columnDefinition = "TEXT")
    private String issue;

    @Column
    private String resolution;

    @Column
    private String additionInfo;

    @Column(columnDefinition = "TEXT")
    private String authSignature;

    @Column(columnDefinition = "TEXT")
    private String confSignature;

    @Column(updatable = false)
    private EnumNotificationMethod notificationMethod;

    @ElementCollection(fetch = FetchType.LAZY)
    private Set<EnumInspection> initInspections;

    @ElementCollection(fetch = FetchType.LAZY)
    private Set<EnumInspection> finalInspections;

    @Column
    private String deposit;

    @Column(unique = true, updatable = false)
    private String reference;

    @Column
    private EnumTransactionStatus status;

    @Column
    private Boolean isDeleted;

    @Column
    private Boolean agreeMember;

    @Column
    private Boolean agreeReceiveMessage;

    @Column
    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private Set<TransactionProduct> products = new HashSet<>();

    @Column
    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL)
    @Builder.Default
    private Set<Comment> comments = new HashSet<>();

    @Column
    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL)
    @Builder.Default
    private Set<WarrantyHistory> warrantyHistories = new HashSet<>();

    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL)
    @OrderColumn
    @Builder.Default
    private Set<MovePath> movePaths = new HashSet<>();

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "init_store_id")
    private Store initStore;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "store_id")
    private Store store;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "created_by")
    private Employee createdBy;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "finalised_by")
    private Employee finalisedBy;

    @Column
    private LocalDateTime finalisedTime;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdDate;

    @LastModifiedDate
    private LocalDateTime lastModifiedDate;

    public void addComment(Comment comment) {
        comments.add(comment);
        comment.setTransaction(this);
    }

    public void setProducts(Set<TransactionProduct> transactionProducts) {

        this.products = transactionProducts.stream().map(transactionProduct -> {
            transactionProduct.setTransaction(this);
            return transactionProduct;
        }).collect(Collectors.toSet());
    }

    public void addProduct(TransactionProduct transactionProduct) {
        products.add(transactionProduct);
        transactionProduct.setTransaction(this);
    }

    public void addMovePath(MovePath movePath) {
        movePaths.add(movePath);
        movePath.setTransaction(this);
    }

    public void addWarrantyHistory(WarrantyHistory warrantyHistory) {
        warrantyHistories.add(warrantyHistory);
        warrantyHistory.setTransaction(this);
    }
}
