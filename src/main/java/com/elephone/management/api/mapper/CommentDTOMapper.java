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

        return new CommentDTO().builder()
                    .id(comment.getId())
                    .content(comment.getContent())
                    .store(comment.getStore())
                    .employee(comment.getEmployee())
                    .build();

    }

    public Comment fromDTO(CommentDTO commentDTO) {
        if(commentDTO == null) {
            return null;
        }

        return new Comment().builder()
                .id(commentDTO.getId())
                .content(commentDTO.getContent())
                .store(new Store().builder().id(commentDTO.getStore().getId()).build())
                .employee(new Employee().builder().id(commentDTO.getEmployee().getId()).build())
                .build();
    }
}
