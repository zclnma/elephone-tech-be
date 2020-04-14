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
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Data
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
    @ManyToMany
    @JoinTable(
            name = "store_employee",
            joinColumns = @JoinColumn(name = "store_id"),
            inverseJoinColumns = @JoinColumn(name = "employee_id")
    )
    private Set<Employee> employees = new HashSet<>();

    @JsonIgnore
    @LastModifiedDate
    private long lastModifiedDate;

    @JsonIgnore
    @CreatedDate
    private long createdDate;
}
