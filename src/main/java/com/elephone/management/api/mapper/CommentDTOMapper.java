package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.domain.Comment;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import org.springframework.stereotype.Component;

@Component
public class CommentDTOMapper {
    public CommentDTO toDTO(Comment comment) {
            if(comment == null) {
                return null;
            }

        return CommentDTO.builder()
                    .id(comment.getId())
                    .content(comment.getContent())
                    .storeId(comment.getStore().getId())
                    .employeeId(comment.getEmployee().getId())
                    .build();

    }

    public Comment fromDTO(CommentDTO commentDTO) {
        if(commentDTO == null) {
            return null;
        }

        return Comment.builder()
                .id(commentDTO.getId())
                .content(commentDTO.getContent())
                .store(Store.builder().id(commentDTO.getId()).build())
                .employee(Employee.builder().id(commentDTO.getEmployeeId()).build())
                .build();
    }
}
