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
    @Min(value = -90, message = "Latitude should not be less thant -90.")
    @Max(value = 90, message = "Latitude should not be more thant 90.")
    private Integer latStart;

    @Column
    @Min(value = -90, message = "Latitude should not be less thant -90.")
    @Max(value = 90, message = "Latitude should not be more thant 90.")
    private Integer latEnd;

    @Column
    @Min(value = -90, message = "Longitude should not be less thant -90.")
    @Max(value = 90, message = "Longitude should not be more thant 90.")
    private Integer lngStart;

    @Column
    @Min(value = -90, message = "Longitude should not be less thant -90.")
    @Max(value = 90, message = "Longitude should not be more thant 90.")
    private Integer lngEnd;
}
