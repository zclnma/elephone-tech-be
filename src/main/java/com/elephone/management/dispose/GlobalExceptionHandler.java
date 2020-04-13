package com.elephone.management.dispose;


import com.elephone.management.dispose.exception.StoreException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.List;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ErrorResponse> handleInvalidMethodArgumentException(MethodArgumentNotValidException ex) {
        List<FieldError> errors = ex.getBindingResult().getFieldErrors();
        if(errors.isEmpty()) {
            return responseEntity("Validation Error", HttpStatus.BAD_REQUEST);
        }
        return responseEntity(errors.get(0).getDefaultMessage(),HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(StoreException.class)
    public ResponseEntity<ErrorResponse> handleStoreException(StoreException ex) {
        return responseEntity(ex.getMessage(),HttpStatus.BAD_REQUEST);
    }

    private static ResponseEntity<ErrorResponse> responseEntity(String message, HttpStatus status) {
        return new ResponseEntity<>(
                ErrorResponse.builder()
                        .timeStamp(System.currentTimeMillis())
                        .error(message)
                        .status(status.value())
                        .build(),
                status);
    }
}
