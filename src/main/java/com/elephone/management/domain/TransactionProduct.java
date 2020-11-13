package com.elephone.management.domain;

import lombok.*;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Embeddable
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class TransactionProduct {

//    @OneToOne
//    @JoinColumn(name = "product_id", referencedColumnName = "id")
//    private Product product;

    private String number;

    private String price;

    private String description;
}
