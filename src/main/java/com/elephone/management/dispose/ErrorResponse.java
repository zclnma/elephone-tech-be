package com.elephone.management.dispose;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ErrorResponse {
    private long timeStamp;
    private int status;
    private String error;
}
