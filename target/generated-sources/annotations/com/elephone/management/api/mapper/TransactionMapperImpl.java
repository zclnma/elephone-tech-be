package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.api.dto.CreateTransactionDTO;
import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.api.dto.TransactionDTO;
import com.elephone.management.api.dto.TransactionProductDTO;
import com.elephone.management.domain.Comment;
import com.elephone.management.domain.EnumInspection;
import com.elephone.management.domain.Transaction;
import com.elephone.management.domain.TransactionProduct;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.annotation.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-27T15:36:59+1100",
    comments = "version: 1.4.1.Final, compiler: javac, environment: Java 11.0.4 (Oracle Corporation)"
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
    @Autowired
    private TransactionProductMapper transactionProductMapper;

    @Override
    public TransactionDTO toDTO(Transaction transaction) {
        if ( transaction == null ) {
            return null;
        }

        List<String> inspections = null;
        List<TransactionProductDTO> products = null;
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
        String battery = null;
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
        products = transactionProductListToTransactionProductDTOList( transaction.getProducts() );
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
        battery = transaction.getBattery();
        email = transaction.getEmail();
        signature = transaction.getSignature();
        store = storeMapper.toDTO( transaction.getStore() );
        createdBy = employeeMapper.toDTO( transaction.getCreatedBy() );
        finalisedBy = employeeMapper.toDTO( transaction.getFinalisedBy() );
        transactionNumber = transaction.getTransactionNumber();
        status = enumTransactionStatusMapper.toString( transaction.getStatus() );
        isFinalised = transaction.getIsFinalised();
        isDeleted = transaction.getIsDeleted();

        TransactionDTO transactionDTO = new TransactionDTO( id, customerName, pickupTime, contact, device, color, imei, passcode, issue, condition, resolution, battery, inspections, email, signature, store, createdBy, finalisedBy, transactionNumber, status, isFinalised, isDeleted, products, comments );

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
        transaction1.setBattery( transaction.getBattery() );
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
        transaction1.setProducts( transactionProductDTOListToTransactionProductList( transaction.getProducts() ) );

        return transaction1;
    }

    @Override
    public Transaction fromCreateDTO(CreateTransactionDTO createTransactionDTO) {
        if ( createTransactionDTO == null ) {
            return null;
        }

        Transaction transaction = new Transaction();

        transaction.setEmail( createTransactionDTO.getEmail() );
        transaction.setCustomerName( createTransactionDTO.getCustomerName() );
        transaction.setPickupTime( createTransactionDTO.getPickupTime() );
        transaction.setContact( createTransactionDTO.getContact() );
        transaction.setDevice( createTransactionDTO.getDevice() );
        transaction.setColor( createTransactionDTO.getColor() );
        transaction.setImei( createTransactionDTO.getImei() );
        transaction.setPasscode( createTransactionDTO.getPasscode() );
        transaction.setBattery( createTransactionDTO.getBattery() );
        transaction.setIssue( createTransactionDTO.getIssue() );
        transaction.setCondition( createTransactionDTO.getCondition() );
        transaction.setResolution( createTransactionDTO.getResolution() );
        transaction.setSignature( createTransactionDTO.getSignature() );
        transaction.setInspections( stringListToEnumInspectionList( createTransactionDTO.getInspections() ) );
        transaction.setProducts( transactionProductDTOListToTransactionProductList( createTransactionDTO.getProducts() ) );

        transaction.setIsFinalised( false );
        transaction.setIsDeleted( false );

        return transaction;
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

    protected List<TransactionProductDTO> transactionProductListToTransactionProductDTOList(List<TransactionProduct> list) {
        if ( list == null ) {
            return null;
        }

        List<TransactionProductDTO> list1 = new ArrayList<TransactionProductDTO>( list.size() );
        for ( TransactionProduct transactionProduct : list ) {
            list1.add( transactionProductMapper.toDTO( transactionProduct ) );
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

    protected List<TransactionProduct> transactionProductDTOListToTransactionProductList(List<TransactionProductDTO> list) {
        if ( list == null ) {
            return null;
        }

        List<TransactionProduct> list1 = new ArrayList<TransactionProduct>( list.size() );
        for ( TransactionProductDTO transactionProductDTO : list ) {
            list1.add( transactionProductMapper.fromDTO( transactionProductDTO ) );
        }

        return list1;
    }
}
