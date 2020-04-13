package com.elephone.management.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
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

    @Column
    private String condition;

    @Column
    private String resolution;

    @Column
    private Boolean inspection;

    @Column
    private String transactionNumber;

    @Column
    private EnumTransactionStatus status;

    @Column
    private boolean isFinalised;

    @JsonIgnore
    @CreatedDate
    private long createdDate;

    @JsonIgnore
    @LastModifiedDate
    private long lastModifiedDate;

}
