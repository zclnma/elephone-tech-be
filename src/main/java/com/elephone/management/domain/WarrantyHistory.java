package com.elephone.management.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table
@Entity
@EntityListeners(AuditingEntityListener.class)
public class WarrantyHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private UUID id;

    @Column(updatable = false)
    private String description;

    @ManyToOne
    @JoinColumn(name = "store_id", nullable = false, updatable = false)
    private Store store;

    @ManyToOne
    @JoinColumn(name = "employee_id", nullable = false, updatable = false)
    private Employee employee;

    @ManyToOne
    @JoinColumn(name = "transaction_id", nullable = false, updatable = false)
    @JsonBackReference
    private Transaction transaction;

    @CreatedDate
    private Date createdDate;

    @LastModifiedDate
    private Date lastModifiedDate;
}
