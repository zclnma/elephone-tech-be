package com.elephone.management.domain;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
@EntityListeners(AuditingEntityListener.class)
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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
    @ManyToMany(cascade = {
            CascadeType.MERGE,
            CascadeType.PERSIST
    })
    @JoinTable(name = "employee_store",
            joinColumns = @JoinColumn(name = "employee_id"),
            inverseJoinColumns = @JoinColumn(name = "store_id")
    )
    private Set<Store> stores = new HashSet<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "default_store_id")
    private Store defaultStore;

    @Column
    private Boolean isActive;

    @Column
    private Boolean isDeleted;

    @LastModifiedDate
    private LocalDateTime lastModifiedDate;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdDate;

    public void addStore(Store store) {
        stores.add(store);
        store.getEmployees().add(this);
    }

    public void removeStore(Store store) {
        stores.remove(store);
        store.getEmployees().remove(this);
    }

    public void setStore(Set<Store> stores) {
        Set<Store> storeSet = stores.stream().map(store -> {
            store.getEmployees().add(this);
            return store;
        }).collect(Collectors.toSet());
        setStores(storeSet);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Employee employee = (Employee) o;
        return id.equals(employee.id) && cognitoId.equals(employee.cognitoId) && username.equals(employee.username);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, cognitoId, username);
    }
}

