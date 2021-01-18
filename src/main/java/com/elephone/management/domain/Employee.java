package com.elephone.management.domain;

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
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private UUID id;

    @Column
    private UUID cognitoId;

    @Column(updatable = false)
    private String username;

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
    private Boolean isActive;

    @Column
    private Boolean isDeleted;

    @Column
    @OneToMany
    @Builder.Default
    private List<Store> stores = new ArrayList<>();

    @LastModifiedDate
    private Date lastModifiedDate;

    @CreatedDate
    private Date createdDate;

}
