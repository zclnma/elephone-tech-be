package com.elephone.management.service;

import com.elephone.management.dispose.exception.CommentException;
import com.elephone.management.domain.Comment;
import com.elephone.management.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
public class CommentService {

    private CommentRepository commentRepository;

    @Autowired
    public CommentService(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    public Comment updateComment(Comment comment) {
        if(comment.getId() == null) {
            throw new CommentException("Comment Id is required.");
        }

        return commentRepository.save(comment);
    }

    @Transactional
    public Comment createComment(Comment comment) {
        if (comment.getId() != null) {
            throw new CommentException("Do not provide comment id.");
        }
        return commentRepository.save(comment);
    }


    @Transactional
    public void deleteCommentById (UUID id) {
        if(id == null) {
            throw new CommentException("Comment Id is required.");
        }

        commentRepository.deleteById(id);
    }
}
