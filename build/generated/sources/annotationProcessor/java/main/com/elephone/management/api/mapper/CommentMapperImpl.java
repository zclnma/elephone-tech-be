package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.domain.Comment;
import java.util.Date;
import java.util.UUID;
import javax.annotation.processing.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2021-02-02T23:54:17+1100",
    comments = "version: 1.4.1.Final, compiler: IncrementalProcessingEnvironment from gradle-language-java-6.7.1.jar, environment: Java 11.0.9.1 (Azul Systems, Inc.)"
)
@Component
public class CommentMapperImpl implements CommentMapper {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public CommentDTO toDTO(Comment comment) {
        if ( comment == null ) {
            return null;
        }

        UUID id = null;
        String content = null;
        EmployeeDTO employee = null;
        Date lastModifiedDate = null;

        id = comment.getId();
        content = comment.getContent();
        employee = employeeMapper.toDTO( comment.getEmployee() );
        lastModifiedDate = comment.getLastModifiedDate();

        CommentDTO commentDTO = new CommentDTO( id, content, employee, lastModifiedDate );

        return commentDTO;
    }

    @Override
    public Comment fromDTO(CommentDTO comment) {
        if ( comment == null ) {
            return null;
        }

        Comment comment1 = new Comment();

        comment1.setId( comment.getId() );
        comment1.setContent( comment.getContent() );
        comment1.setEmployee( employeeMapper.fromDTO( comment.getEmployee() ) );
        comment1.setLastModifiedDate( comment.getLastModifiedDate() );

        return comment1;
    }
}
