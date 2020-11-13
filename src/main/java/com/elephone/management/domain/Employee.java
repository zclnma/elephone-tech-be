package com.elephone.management.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.*;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
@EntityListeners(AuditingEntityListener.class)
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private UUID id;

    @Column
    private UUID cognitoId;

    @Column(updatable = false)
    private String firstName;

    @Column(updatable = false)
    private String lastName;

    @Column(updatable = false)
    private EnumGender gender;

    @Column(updatable = false)
    private String birthday;

    @Column
    private String contact;

    @Column
    private String email;

    @Column
    private String tfn;

    @Column
    private EnumRole role;

    @Column
    @Builder.Default
    private boolean isActive = true;

    @Column
    @Builder.Default
    private boolean isDeleted = false;

    @Column
    @ManyToMany
    @JoinTable(
            name = "employee_store",
            joinColumns = @JoinColumn(name = "employee_id"),
            inverseJoinColumns = @JoinColumn(name = "store_id")
    )
    @Builder.Default
    @JsonManagedReference
    private List<Store> stores = new ArrayList<>();

    @LastModifiedDate
    private Date lastModifiedDate;

    @CreatedDate
    private Date createdDate;

}
