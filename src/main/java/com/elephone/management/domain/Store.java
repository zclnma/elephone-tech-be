package com.elephone.management.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "store")
@EntityListeners(AuditingEntityListener.class)
public class Store {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private UUID id;

    @Column(unique = true)
    private UUID cognitoId;

    @Column(unique = true)
    private String name;

    @Column
    private EnumStoreRole role;

    @Column
    private String contact;

    @Column
    private String abn;

    @Column
    private String sequence;

    @Column
    private Integer warranty;

    @Embedded
    private StoreLocation storeLocation;

    @Column
    @OneToMany(mappedBy = "workingStore")
    private Set<Employee> workingEmployees = new HashSet<>();

    @Column
    @ManyToMany(mappedBy = "stores")
    private Set<Employee> employees = new HashSet<>();


    @JsonIgnore
    @LastModifiedDate
    private Date lastModifiedDate;

    @JsonIgnore
    @CreatedDate
    private Date createdDate;
}
