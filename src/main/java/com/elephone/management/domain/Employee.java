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
import javax.validation.constraints.Email;
import java.util.*;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "employee")
@EntityListeners(AuditingEntityListener.class)
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private UUID id;

    @Column
    private String firstName;

    @Column
    private String lastName;

    @Column
    private EnumGender gender;

    @Column
    private Date birthday;

    @Column
    private String contact;

    @Column
    @Email
    private String email;

    @Column
    private String tfn;

    @Column
    private EnumEmployeeStatus status;

    @Column
    @OneToMany(mappedBy = "employee")
    private Set<WorkHistory> workHistories = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "working_store_id", nullable = false)
    private Store workingStore;

    @Column
    @ManyToMany(mappedBy = "employees")
    private Set<Store> store = new HashSet<>();

    @JsonIgnore
    @LastModifiedDate
    private long lastModifiedDate;

    @JsonIgnore
    @CreatedDate
    private long createdDate;

}
