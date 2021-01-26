package com.elephone.management.dispose;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class ErrorResponse {
    private long timeStamp;
    private int status;
    private String error;
}
