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

    @Column(columnDefinition = "TEXT")
    private String resolution;

    @Column(columnDefinition = "TEXT")
    private String additionInfo;

    @Column(columnDefinition = "TEXT")
    private String authSignature;

    @Column(columnDefinition = "TEXT")
    private String confSignature;

    @Column(updatable = false)
    private EnumNotificationMethod notificationMethod;

    @ElementCollection(fetch = FetchType.EAGER)
    private Set<String> initInspections;

    @ElementCollection(fetch = FetchType.EAGER )
    private Set<String> finalInspections;

    @Column
    private String deposit;

    @Column(updatable = false, unique = true, nullable = false)
    private String reference;

    @Column(nullable = false)
    private Boolean isDeleted;

    @Column
    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private Set<TransactionProduct> products = new HashSet<>();

    @Column
    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Comment> comments = new HashSet<>();

    @Column
    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<WarrantyHistory> warrantyHistories = new HashSet<>();

    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @OrderColumn
    private Set<TransactionTransition> transactionTransitions = new HashSet<>();

    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @OrderColumn
    private Set<TransactionAction> transactionActions = new HashSet<>();

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "transaction_status_id")
    private TransactionStatus transactionStatus;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "init_store_id", updatable = false)
    private Store initStore;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "store_id")
    private Store store;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "created_by", updatable = false)
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

    public void addTransactionTransition(TransactionTransition transactionTransition) {
        transactionTransitions.add(transactionTransition);
        transactionTransition.setTransaction(this);
    }

    public void addTransactionAction(TransactionAction transactionAction) {
        transactionActions.add(transactionAction);
        transactionAction.setTransaction(this);
    }

    public void addWarrantyHistory(WarrantyHistory warrantyHistory) {
        warrantyHistories.add(warrantyHistory);
        warrantyHistory.setTransaction(this);
    }
}
