package com.elephone.management.api.dto;

import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommentDTO {

    private UUID id;

    private String content;

    private Store store;

    private Employee employee;
}
