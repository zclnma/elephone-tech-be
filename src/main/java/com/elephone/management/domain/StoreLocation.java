package com.elephone.management.domain;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

@Data
@Embeddable
public class StoreLocation {

    @Column
    @Min(-90)
    @Max(90)
    private Integer latStart;

    @Column
    @Min(-90)
    @Max(90)
    private Integer latEnd;

    @Column
    @Min(-90)
    @Max(90)
    private Integer lngStart;

    @Column
    @Min(-90)
    @Max(90)
    private Integer lngEnd;
}
