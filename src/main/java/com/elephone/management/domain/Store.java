package com.elephone.management.domain;

import lombok.*;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
@EntityListeners(AuditingEntityListener.class)
public class Store {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Column(unique = true, nullable = false)
    private String name;

    @Column
    private String companyName;

    @Column
    private String contact;

    @Column
    private String abn;

    @Column
    private String email;

    @Column
    private String address;

    @Column
    private String suburb;

    @Column
    private String state;

    @Column
    private String postcode;

    @Column(columnDefinition = "serial")
    @Generated(GenerationTime.ALWAYS)
    private String sequence;

    @Column
    private Integer warranty;

    @ManyToMany(mappedBy = "stores")
    @Builder.Default
    private Set<Employee> employees = new HashSet<>();

    @Column
    @Builder.Default
    private Integer reference = 0;

    @Column
    @Builder.Default
    private Boolean isDeleted = false;

    @Column
    private LocalDateTime deletedAt;

    @LastModifiedDate
    private LocalDateTime lastModifiedDate;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdDate;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Store store = (Store) o;
        return id.equals(store.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
