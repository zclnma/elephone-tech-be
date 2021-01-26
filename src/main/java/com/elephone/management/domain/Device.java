package com.elephone.management.domain;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
@EntityListeners(AuditingEntityListener.class)
public class Device {

    @Id
    private UUID id;

    @Column
    private String name;

    @Column
    private String color;

    @Column
    private String imei;

    @Column
    private String passcode;

    @OneToOne(fetch = FetchType.LAZY)
    @MapsId
    private Transaction transaction;

    @CreatedDate
    private Date createdDate;
}
