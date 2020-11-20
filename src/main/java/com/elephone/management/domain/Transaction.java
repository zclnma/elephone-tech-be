package com.elephone.management.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
    private String pickupTime;

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

    @Column(columnDefinition = "text")
    private String issue;

    @Column(name = "product_condition")
    private String condition;

    @Column
    private String resolution;

    @Column(columnDefinition = "TEXT")
    private String signature;

    @Column
    @ElementCollection
    private List<EnumInspection> inspections;

    @Column(unique = true)
    private String transactionNumber;

    @Column
    private EnumTransactionStatus status;

    @Column
    private Boolean isFinalised;

    @Column
    private Boolean isDeleted;

    @Column
    private String finalisedTime;

    @Column
    @OneToMany(mappedBy = "transaction")
    @JsonManagedReference
    private List<Comment> comments;

    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;

    @ManyToOne
    @JoinColumn(name = "created_by")
    private Employee createdBy;

    @ManyToOne
    @JoinColumn(name = "finalised_by")
    private Employee finalisedBy;

    @ElementCollection
    private List<TransactionProduct> products;

    @Column
    private Date doneTime;

    @Column
    private Date sendTime;

    @CreatedDate
    private Date createdDate;

    @LastModifiedDate
    private Date lastModifiedDate;

}
