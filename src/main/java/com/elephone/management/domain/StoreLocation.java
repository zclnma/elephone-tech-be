package com.elephone.management.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Embeddable
public class StoreLocation {

    @Column
    @Min(value = -90, message = "Latitude should not be less thant -90.")
    @Max(value = 90, message = "Latitude should not be more thant 90.")
    private Float latStart;

    @Column
    @Min(value = -90, message = "Latitude should not be less thant -90.")
    @Max(value = 90, message = "Latitude should not be more thant 90.")
    private Float latEnd;

    @Column
    @Min(value = -90, message = "Longitude should not be less thant -90.")
    @Max(value = 90, message = "Longitude should not be more thant 90.")
    private Float lngStart;

    @Column
    @Min(value = -90, message = "Longitude should not be less thant -90.")
    @Max(value = 90, message = "Longitude should not be more thant 90.")
    private Float lngEnd;
}
