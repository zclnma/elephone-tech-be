package com.elephone.management.dispose.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class StoreException extends RuntimeException {
    public StoreException() {
        super("Value Mapping is invalid");
    }

    public StoreException(String message) {
        super(message);
    }

    public StoreException(String message, Throwable th) {
        super(message, th);
    }
}
