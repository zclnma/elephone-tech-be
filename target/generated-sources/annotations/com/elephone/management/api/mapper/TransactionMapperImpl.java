package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.api.dto.TransactionDTO;
import com.elephone.management.domain.Comment;
import com.elephone.management.domain.EnumInspection;
import com.elephone.management.domain.Transaction;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.annotation.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-15T17:18:20+1100",
    comments = "version: 1.4.1.Final, compiler: javac, environment: Java 1.8.0_211 (Oracle Corporation)"
)
@Component
public class TransactionMapperImpl implements TransactionMapper {

    @Autowired
    private StoreMapper storeMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private EnumTransactionStatusMapper enumTransactionStatusMapper;
    @Autowired
    private EnumInspectionMapper enumInspectionMapper;

    @Override
    public TransactionDTO toDTO(Transaction transaction) {
        if ( transaction == null ) {
            return null;
        }

        List<String> inspections = null;
        List<CommentDTO> comments = null;
        UUID id = null;
        String customerName = null;
        String pickupTime = null;
        String contact = null;
        String device = null;
        String color = null;
        String imei = null;
        String passcode = null;
        String issue = null;
        String condition = null;
        String resolution = null;
        String email = null;
        String signature = null;
        StoreDTO store = null;
        EmployeeDTO createdBy = null;
        EmployeeDTO finalisedBy = null;
        String transactionNumber = null;
        String status = null;
        Boolean isFinalised = null;
        Boolean isDeleted = null;

        inspections = enumInspectionListToStringList( transaction.getInspections() );
        comments = commentListToCommentDTOList( transaction.getComments() );
        id = transaction.getId();
        customerName = transaction.getCustomerName();
        pickupTime = transaction.getPickupTime();
        contact = transaction.getContact();
        device = transaction.getDevice();
        color = transaction.getColor();
        imei = transaction.getImei();
        passcode = transaction.getPasscode();
        issue = transaction.getIssue();
        condition = transaction.getCondition();
        resolution = transaction.getResolution();
        email = transaction.getEmail();
        signature = transaction.getSignature();
        store = storeMapper.toDTO( transaction.getStore() );
        createdBy = employeeMapper.toDTO( transaction.getCreatedBy() );
        finalisedBy = employeeMapper.toDTO( transaction.getFinalisedBy() );
        transactionNumber = transaction.getTransactionNumber();
        status = enumTransactionStatusMapper.toString( transaction.getStatus() );
        isFinalised = transaction.getIsFinalised();
        isDeleted = transaction.getIsDeleted();

        String battery = null;
        List<UUID> productId = null;

        TransactionDTO transactionDTO = new TransactionDTO( id, customerName, pickupTime, contact, device, color, imei, passcode, issue, condition, resolution, battery, inspections, email, signature, store, createdBy, finalisedBy, transactionNumber, status, isFinalised, isDeleted, productId, comments );

        return transactionDTO;
    }

    @Override
    public Transaction fromDTO(TransactionDTO transaction) {
        if ( transaction == null ) {
            return null;
        }

        Transaction transaction1 = new Transaction();

        if ( transaction.getIsFinalised() != null ) {
            transaction1.setIsFinalised( transaction.getIsFinalised() );
        }
        else {
            transaction1.setIsFinalised( false );
        }
        if ( transaction.getIsDeleted() != null ) {
            transaction1.setIsDeleted( transaction.getIsDeleted() );
        }
        else {
            transaction1.setIsDeleted( false );
        }
        transaction1.setId( transaction.getId() );
        transaction1.setEmail( transaction.getEmail() );
        transaction1.setCustomerName( transaction.getCustomerName() );
        transaction1.setPickupTime( transaction.getPickupTime() );
        transaction1.setContact( transaction.getContact() );
        transaction1.setDevice( transaction.getDevice() );
        transaction1.setColor( transaction.getColor() );
        transaction1.setImei( transaction.getImei() );
        transaction1.setPasscode( transaction.getPasscode() );
        transaction1.setIssue( transaction.getIssue() );
        transaction1.setCondition( transaction.getCondition() );
        transaction1.setResolution( transaction.getResolution() );
        transaction1.setSignature( transaction.getSignature() );
        transaction1.setInspections( stringListToEnumInspectionList( transaction.getInspections() ) );
        transaction1.setTransactionNumber( transaction.getTransactionNumber() );
        transaction1.setStatus( enumTransactionStatusMapper.toEnum( transaction.getStatus() ) );
        transaction1.setComments( commentDTOListToCommentList( transaction.getComments() ) );
        transaction1.setStore( storeMapper.fromDTO( transaction.getStore() ) );
        transaction1.setCreatedBy( employeeMapper.fromDTO( transaction.getCreatedBy() ) );
        transaction1.setFinalisedBy( employeeMapper.fromDTO( transaction.getFinalisedBy() ) );

        return transaction1;
    }

    protected List<String> enumInspectionListToStringList(List<EnumInspection> list) {
        if ( list == null ) {
            return null;
        }

        List<String> list1 = new ArrayList<String>( list.size() );
        for ( EnumInspection enumInspection : list ) {
            list1.add( enumInspectionMapper.toString( enumInspection ) );
        }

        return list1;
    }

    protected CommentDTO commentToCommentDTO(Comment comment) {
        if ( comment == null ) {
            return null;
        }

        UUID id = null;
        String content = null;
        EmployeeDTO employee = null;
        TransactionDTO transaction = null;
        Date lastModifiedDate = null;

        id = comment.getId();
        content = comment.getContent();
        employee = employeeMapper.toDTO( comment.getEmployee() );
        transaction = toDTO( comment.getTransaction() );
        lastModifiedDate = comment.getLastModifiedDate();

        CommentDTO commentDTO = new CommentDTO( id, content, employee, transaction, lastModifiedDate );

        return commentDTO;
    }

    protected List<CommentDTO> commentListToCommentDTOList(List<Comment> list) {
        if ( list == null ) {
            return null;
        }

        List<CommentDTO> list1 = new ArrayList<CommentDTO>( list.size() );
        for ( Comment comment : list ) {
            list1.add( commentToCommentDTO( comment ) );
        }

        return list1;
    }

    protected List<EnumInspection> stringListToEnumInspectionList(List<String> list) {
        if ( list == null ) {
            return null;
        }

        List<EnumInspection> list1 = new ArrayList<EnumInspection>( list.size() );
        for ( String string : list ) {
            list1.add( enumInspectionMapper.toEnum( string ) );
        }

        return list1;
    }

    protected Comment commentDTOToComment(CommentDTO commentDTO) {
        if ( commentDTO == null ) {
            return null;
        }

        Comment comment = new Comment();

        comment.setId( commentDTO.getId() );
        comment.setContent( commentDTO.getContent() );
        comment.setEmployee( employeeMapper.fromDTO( commentDTO.getEmployee() ) );
        comment.setTransaction( fromDTO( commentDTO.getTransaction() ) );
        comment.setLastModifiedDate( commentDTO.getLastModifiedDate() );

        return comment;
    }

    protected List<Comment> commentDTOListToCommentList(List<CommentDTO> list) {
        if ( list == null ) {
            return null;
        }

        List<Comment> list1 = new ArrayList<Comment>( list.size() );
        for ( CommentDTO commentDTO : list ) {
            list1.add( commentDTOToComment( commentDTO ) );
        }

        return list1;
    }
}
