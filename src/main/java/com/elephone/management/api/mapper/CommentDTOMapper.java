package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.domain.Comment;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import com.elephone.management.domain.Transaction;
import org.springframework.stereotype.Component;

@Component
public class CommentDTOMapper {
    public CommentDTO toDTO(Comment comment) {
        if (comment == null) {
            return null;
        }

        return CommentDTO.builder()
                .id(comment.getId())
                .content(comment.getContent())
                .transactionId(comment.getTransaction().getId())
                .employeeId(comment.getEmployee().getId())
                .lastModifiedDate(comment.getLastModifiedDate())
                .build();

    }

    public Comment fromDTO(CommentDTO commentDTO) {
        if (commentDTO == null) {
            return null;
        }

        return Comment.builder()
                .id(commentDTO.getId())
                .content(commentDTO.getContent())
                .transaction(Transaction.builder().id(commentDTO.getTransactionId()).build())
                .employee(Employee.builder().id(commentDTO.getEmployeeId()).build())
                .build();
    }
}
