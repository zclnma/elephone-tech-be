package com.elephone.management.service;

import com.elephone.management.api.dto.CreateCommentDTO;
import com.elephone.management.dispose.exception.CommentException;
import com.elephone.management.domain.Comment;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Transaction;
import com.elephone.management.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
public class CommentService {

    private final CommentRepository commentRepository;
    private final TransactionService transactionService;
    private final EmployeeService employeeService;


    @Autowired
    public CommentService(CommentRepository commentRepository, TransactionService transactionService, EmployeeService employeeService) {
        this.commentRepository = commentRepository;
        this.transactionService = transactionService;
        this.employeeService = employeeService;
    }

    public Comment updateComment(CreateCommentDTO updateComment) {
        if (updateComment.getId() == null) {
            throw new CommentException("Comment Id is required.");
        }

        Comment comment = commentRepository.findById(updateComment.getId()).orElseThrow(() -> new CommentException("Comment not found."));
        comment.setContent(updateComment.getContent());
        return commentRepository.save(comment);
    }

    @Transactional
    public Comment createComment(CreateCommentDTO createCommentDTO) {
        if (createCommentDTO.getId() != null) {
            throw new CommentException("Do not provide comment id.");
        }
        Transaction transaction = transactionService.getTransactionById(createCommentDTO.getTransactionId());
        Employee employee = employeeService.getEmployeeById(createCommentDTO.getEmployeeId());
        Comment comment = Comment.builder()
                .transaction(transaction)
                .employee(employee)
                .content(createCommentDTO.getContent())
                .build();
        return commentRepository.save(comment);
    }


    @Transactional
    public void deleteCommentById(UUID id) {
        if (id == null) {
            throw new CommentException("Comment Id is required.");
        }

        commentRepository.deleteById(id);
    }
}
