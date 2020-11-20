package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.api.dto.TransactionDTO;
import com.elephone.management.api.dto.TransactionDTO.TransactionDTOBuilder;
import com.elephone.management.domain.Comment;
import com.elephone.management.domain.EnumInspection;
import com.elephone.management.domain.Transaction;
import com.elephone.management.domain.Transaction.TransactionBuilder;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-20T18:52:25+1100",
    comments = "version: 1.4.1.Final, compiler: javac, environment: Java 1.8.0_211 (Oracle Corporation)"
)
@Component
public class TransactionMapperImpl implements TransactionMapper {

    @Autowired
    private CommentMapper commentMapper;
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

        TransactionDTOBuilder transactionDTO = TransactionDTO.builder();

        transactionDTO.id( transaction.getId() );
        transactionDTO.customerName( transaction.getCustomerName() );
        transactionDTO.pickupTime( transaction.getPickupTime() );
        transactionDTO.contact( transaction.getContact() );
        transactionDTO.device( transaction.getDevice() );
        transactionDTO.color( transaction.getColor() );
        transactionDTO.imei( transaction.getImei() );
        transactionDTO.passcode( transaction.getPasscode() );
        transactionDTO.issue( transaction.getIssue() );
        transactionDTO.condition( transaction.getCondition() );
        transactionDTO.resolution( transaction.getResolution() );
        transactionDTO.battery( transaction.getBattery() );
        transactionDTO.inspections( enumInspectionListToStringList( transaction.getInspections() ) );
        transactionDTO.email( transaction.getEmail() );
        transactionDTO.signature( transaction.getSignature() );
        transactionDTO.store( storeMapper.toDTO( transaction.getStore() ) );
        transactionDTO.createdBy( employeeMapper.toDTO( transaction.getCreatedBy() ) );
        transactionDTO.finalisedBy( employeeMapper.toDTO( transaction.getFinalisedBy() ) );
        transactionDTO.transactionNumber( transaction.getTransactionNumber() );
        transactionDTO.status( enumTransactionStatusMapper.toString( transaction.getStatus() ) );
        transactionDTO.isFinalised( transaction.getIsFinalised() );
        transactionDTO.isDeleted( transaction.getIsDeleted() );
        transactionDTO.comments( commentListToCommentDTOList( transaction.getComments() ) );

        return transactionDTO.build();
    }

    @Override
    public Transaction fromDTO(TransactionDTO transaction) {
        if ( transaction == null ) {
            return null;
        }

        TransactionBuilder transaction1 = Transaction.builder();

        if ( transaction.getIsFinalised() != null ) {
            transaction1.isFinalised( transaction.getIsFinalised() );
        }
        else {
            transaction1.isFinalised( false );
        }
        if ( transaction.getIsDeleted() != null ) {
            transaction1.isDeleted( transaction.getIsDeleted() );
        }
        else {
            transaction1.isDeleted( false );
        }
        transaction1.id( transaction.getId() );
        transaction1.email( transaction.getEmail() );
        transaction1.customerName( transaction.getCustomerName() );
        transaction1.pickupTime( transaction.getPickupTime() );
        transaction1.contact( transaction.getContact() );
        transaction1.device( transaction.getDevice() );
        transaction1.color( transaction.getColor() );
        transaction1.imei( transaction.getImei() );
        transaction1.passcode( transaction.getPasscode() );
        transaction1.battery( transaction.getBattery() );
        transaction1.issue( transaction.getIssue() );
        transaction1.condition( transaction.getCondition() );
        transaction1.resolution( transaction.getResolution() );
        transaction1.signature( transaction.getSignature() );
        transaction1.inspections( stringListToEnumInspectionList( transaction.getInspections() ) );
        transaction1.transactionNumber( transaction.getTransactionNumber() );
        transaction1.status( enumTransactionStatusMapper.toEnum( transaction.getStatus() ) );
        transaction1.comments( commentDTOListToCommentList( transaction.getComments() ) );
        transaction1.store( storeMapper.fromDTO( transaction.getStore() ) );
        transaction1.createdBy( employeeMapper.fromDTO( transaction.getCreatedBy() ) );
        transaction1.finalisedBy( employeeMapper.fromDTO( transaction.getFinalisedBy() ) );

        return transaction1.build();
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

    protected List<CommentDTO> commentListToCommentDTOList(List<Comment> list) {
        if ( list == null ) {
            return null;
        }

        List<CommentDTO> list1 = new ArrayList<CommentDTO>( list.size() );
        for ( Comment comment : list ) {
            list1.add( commentMapper.toDTO( comment ) );
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

    protected List<Comment> commentDTOListToCommentList(List<CommentDTO> list) {
        if ( list == null ) {
            return null;
        }

        List<Comment> list1 = new ArrayList<Comment>( list.size() );
        for ( CommentDTO commentDTO : list ) {
            list1.add( commentMapper.fromDTO( commentDTO ) );
        }

        return list1;
    }
}
