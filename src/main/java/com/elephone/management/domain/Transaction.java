package com.elephone.management.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.*;

@Data
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

    @Column
    private String email;

    @Column
    private String customerName;

    @Column
    private String contact;

    @Column
    private String device;

    @Column
    private String color;

    @Column
    private String imei;

    @Column
    private String passcode;

    @Column
    private String battery;

    @Column
    private String additionInfo;

    @Column(columnDefinition = "TEXT")
    private String issue;

    @Column
    private String resolution;

    @Column(columnDefinition = "TEXT")
    private String authSignature;

    @Column(columnDefinition = "TEXT")
    private String confSignature;

    @Column(updatable = false)
    private EnumNotificationMethod notificationMethod;

    @Column
    @ElementCollection
    private List<EnumInspection> inspections;

    @Column(unique = true, updatable = false)
    private String reference;

    @Column
    private EnumTransactionStatus status;

    @Column
    private Boolean isDeleted;

    @Column
    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Comment> comments;

    @Column
    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<WarrantyHistory> warrantyHistories;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "init_store_id", updatable = false)
    private Store initStore;

    @OneToMany(mappedBy = "transaction", cascade = CascadeType.ALL)
    @OrderColumn
    private List<MovePath> movePath;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_id")
    private Store store;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "created_by", updatable = false)
    private Employee createdBy;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "finalised_by")
    private Employee finalisedBy;

    @ElementCollection
    private List<TransactionProduct> products;

    @Column
    private String deposit;

    @Column
    private Date finalisedTime;

    @CreatedDate
    private Date createdDate;

    @LastModifiedDate
    private Date lastModifiedDate;

    public void addComment(Comment comment) {
        comments.add(comment);
        comment.setTransaction(this);
    }
}
