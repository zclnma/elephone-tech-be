package com.elephone.management.dispose.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class IncomeException extends RuntimeException {
    public IncomeException (String message) {
        super(message);
    }
}
