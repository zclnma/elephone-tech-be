package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.domain.Comment;
import com.elephone.management.domain.Comment.CommentBuilder;
import java.util.Date;
import java.util.UUID;
import javax.annotation.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-20T18:47:37+1100",
    comments = "version: 1.4.1.Final, compiler: javac, environment: Java 1.8.0_211 (Oracle Corporation)"
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

        CommentBuilder comment1 = Comment.builder();

        comment1.id( comment.getId() );
        comment1.content( comment.getContent() );
        comment1.employee( employeeMapper.fromDTO( comment.getEmployee() ) );
        comment1.lastModifiedDate( comment.getLastModifiedDate() );

        return comment1.build();
    }
}
