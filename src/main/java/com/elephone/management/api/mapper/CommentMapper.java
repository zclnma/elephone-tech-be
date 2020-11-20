package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.Comment;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import java.util.List;

@Mapper(config = MapstructConfig.class, uses = {TransactionMapper.class, EmployeeMapper.class})
public interface CommentMapper {

    CommentDTO toDTO(Comment comment);

    Comment fromDTO(CommentDTO comment);
}
