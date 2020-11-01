package com.elephone.management.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "transaction")
@EntityListeners(AuditingEntityListener.class)
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

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

    @Column(columnDefinition = "text")
    private String issue;

    @Column(name = "product_condition")
    private String condition;

    @Column
    private String resolution;

    @Column(columnDefinition = "boolean default false")
    private Boolean inspection = false;

    @Column(unique = true)
    private String transactionNumber;

    @Column
    private EnumTransactionStatus status = EnumTransactionStatus.WAIT;

    @Column(columnDefinition = "boolean default false")
    private Boolean isFinalised = false;

    @Column
    private String finalisedTime;

    @Column
    @OneToMany(mappedBy = "transaction")
    @JsonManagedReference
    private List<Comment> comments = new ArrayList<>();

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

    @CreatedDate
    private Date createdDate;

    @LastModifiedDate
    private Date lastModifiedDate;

}
