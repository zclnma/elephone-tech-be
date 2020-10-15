package com.elephone.management.api;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.api.mapper.CommentDTOMapper;
import com.elephone.management.domain.Comment;
import com.elephone.management.service.CommentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.UUID;
import java.util.logging.Handler;

@RestController
@RequestMapping("/api/v1/comment")
@Api(tags = "Employee Management")
@PreAuthorize("hasAuthority('USER')")
public class CommentResource {

    private CommentService commentService;
    private CommentDTOMapper commentDTOMapper;

    @Autowired
    public CommentResource (CommentService commentService, CommentDTOMapper commentDTOMapper) {
        this.commentDTOMapper = commentDTOMapper;
        this.commentService = commentService;
    }

    @PostMapping
    @ApiOperation(value = "Create comment", notes = "Create comment")
    public ResponseEntity<CommentDTO> create (@Valid @RequestBody CommentDTO commentDTO) {
        Comment comment = commentService.createComment(commentDTOMapper.fromDTO(commentDTO));
        return new ResponseEntity<>(commentDTOMapper.toDTO(comment), HttpStatus.CREATED);
    }

    @PutMapping
    @ApiOperation(value = "Update comment", notes = "Update comment")
    public ResponseEntity<CommentDTO> update (@Valid @RequestBody CommentDTO commentDTO) {
        Comment comment = commentService.updateComment(commentDTOMapper.fromDTO(commentDTO));
        return new ResponseEntity<>(commentDTOMapper.toDTO(comment), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "Delete comment by id", notes = "Delete comment")
    public ResponseEntity<?> delete (@PathVariable UUID id) {
        commentService.deleteCommentById(id);
        return new ResponseEntity<>(new HashMap<String, String>() {{
            put("message", "Comment: " + id + " has been deleed");
        }}, HttpStatus.ACCEPTED);
    }
}
