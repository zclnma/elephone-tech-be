package com.elephone.management.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
public class Store {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private UUID id;

    @Column(unique = true)
    private String name;

    @Column
    private String contact;

    @Column
    private String abn;

    @Column(unique = true)
    private String sequence;

    @Column
    private Integer warranty;

    @Column
    @Builder.Default
    private Boolean isDeleted = true;

    @Column
    @ManyToMany(mappedBy = "stores")
    @Builder.Default
    @JsonBackReference
    private List<Employee> employees = new ArrayList<>();

    @LastModifiedDate
    private Date lastModifiedDate;

    @CreatedDate
    private Date createdDate;
}
