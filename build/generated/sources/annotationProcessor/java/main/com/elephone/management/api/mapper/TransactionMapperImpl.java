package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.api.dto.CreateTransactionDTO;
import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.api.dto.MovePathDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.api.dto.TransactionDTO;
import com.elephone.management.api.dto.TransactionProductDTO;
import com.elephone.management.api.dto.UpdateTransactionDTO;
import com.elephone.management.api.dto.WarrantyHistoryDTO;
import com.elephone.management.domain.Comment;
import com.elephone.management.domain.Customer;
import com.elephone.management.domain.Device;
import com.elephone.management.domain.EnumInspection;
import com.elephone.management.domain.MovePath;
import com.elephone.management.domain.Transaction;
import com.elephone.management.domain.TransactionProduct;
import com.elephone.management.domain.WarrantyHistory;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
    private EnumNotificationMethodMapper enumNotificationMethodMapper;
    @Autowired
    private TransactionProductMapper transactionProductMapper;
    @Autowired
    private WarrantyHistoryMapper warrantyHistoryMapper;
    @Autowired
    private MovePathMapper movePathMapper;

    @Override
    public TransactionDTO toDTO(Transaction transaction) {
        if ( transaction == null ) {
            return null;
        }

        String customerName = null;
        String email = null;
        String contact = null;
        String device = null;
        String color = null;
        String imei = null;
        String passcode = null;
        Set<String> initInspections = null;
        Set<String> finalInspections = null;
        Set<TransactionProductDTO> products = null;
        Set<MovePathDTO> movePaths = null;
        Set<CommentDTO> comments = null;
        Set<WarrantyHistoryDTO> warrantyHistories = null;
        UUID id = null;
        String issue = null;
        String resolution = null;
        String battery = null;
        String authSignature = null;
        String confSignature = null;
        StoreDTO store = null;
        EmployeeDTO createdBy = null;
        EmployeeDTO finalisedBy = null;
        String reference = null;
        String status = null;
        String additionInfo = null;
        String deposit = null;
        Date createdDate = null;

        customerName = transactionCustomerName( transaction );
        email = transactionCustomerEmail( transaction );
        contact = transactionCustomerContact( transaction );
        device = transactionDeviceName( transaction );
        color = transactionDeviceColor( transaction );
        imei = transactionDeviceImei( transaction );
        passcode = transactionDevicePasscode( transaction );
        initInspections = enumInspectionSetToStringSet( transaction.getInitInspections() );
        finalInspections = enumInspectionSetToStringSet( transaction.getFinalInspections() );
        products = transactionProductSetToTransactionProductDTOSet( transaction.getProducts() );
        movePaths = movePathSetToMovePathDTOSet( transaction.getMovePaths() );
        comments = commentSetToCommentDTOSet( transaction.getComments() );
        warrantyHistories = warrantyHistorySetToWarrantyHistoryDTOSet( transaction.getWarrantyHistories() );
        id = transaction.getId();
        issue = transaction.getIssue();
        resolution = transaction.getResolution();
        battery = transaction.getBattery();
        authSignature = transaction.getAuthSignature();
        confSignature = transaction.getConfSignature();
        store = storeMapper.toDTO( transaction.getStore() );
        createdBy = employeeMapper.toDTO( transaction.getCreatedBy() );
        finalisedBy = employeeMapper.toDTO( transaction.getFinalisedBy() );
        reference = transaction.getReference();
        status = enumTransactionStatusMapper.toString( transaction.getStatus() );
        additionInfo = transaction.getAdditionInfo();
        deposit = transaction.getDeposit();
        createdDate = transaction.getCreatedDate();

        TransactionDTO transactionDTO = new TransactionDTO( id, customerName, contact, device, color, imei, passcode, issue, resolution, battery, initInspections, finalInspections, email, authSignature, confSignature, store, createdBy, finalisedBy, reference, status, additionInfo, products, movePaths, deposit, comments, warrantyHistories, createdDate );

        return transactionDTO;
    }

    @Override
    public Transaction fromDTO(TransactionDTO transaction) {
        if ( transaction == null ) {
            return null;
        }

        Transaction transaction1 = new Transaction();

        transaction1.setCustomer( transactionDTOToCustomer( transaction ) );
        transaction1.setDevice( transactionDTOToDevice( transaction ) );
        transaction1.setProducts( transactionProductDTOSetToTransactionProductSet( transaction.getProducts() ) );
        transaction1.setId( transaction.getId() );
        transaction1.setBattery( transaction.getBattery() );
        transaction1.setIssue( transaction.getIssue() );
        transaction1.setResolution( transaction.getResolution() );
        transaction1.setAdditionInfo( transaction.getAdditionInfo() );
        transaction1.setAuthSignature( transaction.getAuthSignature() );
        transaction1.setConfSignature( transaction.getConfSignature() );
        transaction1.setInitInspections( stringSetToEnumInspectionSet( transaction.getInitInspections() ) );
        transaction1.setFinalInspections( stringSetToEnumInspectionSet( transaction.getFinalInspections() ) );
        transaction1.setDeposit( transaction.getDeposit() );
        transaction1.setReference( transaction.getReference() );
        transaction1.setStatus( enumTransactionStatusMapper.toEnum( transaction.getStatus() ) );
        transaction1.setComments( commentDTOSetToCommentSet( transaction.getComments() ) );
        transaction1.setWarrantyHistories( warrantyHistoryDTOSetToWarrantyHistorySet( transaction.getWarrantyHistories() ) );
        transaction1.setMovePaths( movePathDTOSetToMovePathSet( transaction.getMovePaths() ) );
        transaction1.setStore( storeMapper.fromDTO( transaction.getStore() ) );
        transaction1.setCreatedBy( employeeMapper.fromDTO( transaction.getCreatedBy() ) );
        transaction1.setFinalisedBy( employeeMapper.fromDTO( transaction.getFinalisedBy() ) );
        transaction1.setCreatedDate( transaction.getCreatedDate() );

        transaction1.setIsDeleted( false );

        return transaction1;
    }

    @Override
    public Transaction fromCreateDTO(CreateTransactionDTO createTransactionDTO) {
        if ( createTransactionDTO == null ) {
            return null;
        }

        Transaction transaction = new Transaction();

        transaction.setCustomer( createTransactionDTOToCustomer( createTransactionDTO ) );
        transaction.setDevice( createTransactionDTOToDevice( createTransactionDTO ) );
        if ( createTransactionDTO.getDeposit() != null ) {
            transaction.setDeposit( createTransactionDTO.getDeposit() );
        }
        else {
            transaction.setDeposit( "0" );
        }
        transaction.setProducts( transactionProductDTOListToTransactionProductSet( createTransactionDTO.getProducts() ) );
        transaction.setId( createTransactionDTO.getId() );
        transaction.setBattery( createTransactionDTO.getBattery() );
        transaction.setIssue( createTransactionDTO.getIssue() );
        transaction.setResolution( createTransactionDTO.getResolution() );
        transaction.setAdditionInfo( createTransactionDTO.getAdditionInfo() );
        transaction.setAuthSignature( createTransactionDTO.getAuthSignature() );
        transaction.setNotificationMethod( enumNotificationMethodMapper.toEnum( createTransactionDTO.getNotificationMethod() ) );
        transaction.setInitInspections( stringSetToEnumInspectionSet( createTransactionDTO.getInitInspections() ) );

        transaction.setIsDeleted( false );

        return transaction;
    }

    @Override
    public Transaction fromUpdateDTO(UpdateTransactionDTO updateTransactionDTO) {
        if ( updateTransactionDTO == null ) {
            return null;
        }

        Transaction transaction = new Transaction();

        transaction.setCustomer( updateTransactionDTOToCustomer( updateTransactionDTO ) );
        transaction.setDevice( updateTransactionDTOToDevice( updateTransactionDTO ) );
        if ( updateTransactionDTO.getDeposit() != null ) {
            transaction.setDeposit( updateTransactionDTO.getDeposit() );
        }
        else {
            transaction.setDeposit( "0" );
        }
        transaction.setProducts( transactionProductDTOListToTransactionProductSet( updateTransactionDTO.getProducts() ) );
        transaction.setId( updateTransactionDTO.getId() );
        transaction.setBattery( updateTransactionDTO.getBattery() );
        transaction.setIssue( updateTransactionDTO.getIssue() );
        transaction.setResolution( updateTransactionDTO.getResolution() );
        transaction.setAdditionInfo( updateTransactionDTO.getAdditionInfo() );
        transaction.setConfSignature( updateTransactionDTO.getConfSignature() );
        transaction.setNotificationMethod( enumNotificationMethodMapper.toEnum( updateTransactionDTO.getNotificationMethod() ) );
        transaction.setInitInspections( stringSetToEnumInspectionSet( updateTransactionDTO.getInitInspections() ) );
        transaction.setFinalInspections( stringSetToEnumInspectionSet( updateTransactionDTO.getFinalInspections() ) );

        transaction.setIsDeleted( false );

        return transaction;
    }

    private String transactionCustomerName(Transaction transaction) {
        if ( transaction == null ) {
            return null;
        }
        Customer customer = transaction.getCustomer();
        if ( customer == null ) {
            return null;
        }
        String name = customer.getName();
        if ( name == null ) {
            return null;
        }
        return name;
    }

    private String transactionCustomerEmail(Transaction transaction) {
        if ( transaction == null ) {
            return null;
        }
        Customer customer = transaction.getCustomer();
        if ( customer == null ) {
            return null;
        }
        String email = customer.getEmail();
        if ( email == null ) {
            return null;
        }
        return email;
    }

    private String transactionCustomerContact(Transaction transaction) {
        if ( transaction == null ) {
            return null;
        }
        Customer customer = transaction.getCustomer();
        if ( customer == null ) {
            return null;
        }
        String contact = customer.getContact();
        if ( contact == null ) {
            return null;
        }
        return contact;
    }

    private String transactionDeviceName(Transaction transaction) {
        if ( transaction == null ) {
            return null;
        }
        Device device = transaction.getDevice();
        if ( device == null ) {
            return null;
        }
        String name = device.getName();
        if ( name == null ) {
            return null;
        }
        return name;
    }

    private String transactionDeviceColor(Transaction transaction) {
        if ( transaction == null ) {
            return null;
        }
        Device device = transaction.getDevice();
        if ( device == null ) {
            return null;
        }
        String color = device.getColor();
        if ( color == null ) {
            return null;
        }
        return color;
    }

    private String transactionDeviceImei(Transaction transaction) {
        if ( transaction == null ) {
            return null;
        }
        Device device = transaction.getDevice();
        if ( device == null ) {
            return null;
        }
        String imei = device.getImei();
        if ( imei == null ) {
            return null;
        }
        return imei;
    }

    private String transactionDevicePasscode(Transaction transaction) {
        if ( transaction == null ) {
            return null;
        }
        Device device = transaction.getDevice();
        if ( device == null ) {
            return null;
        }
        String passcode = device.getPasscode();
        if ( passcode == null ) {
            return null;
        }
        return passcode;
    }

    protected Set<String> enumInspectionSetToStringSet(Set<EnumInspection> set) {
        if ( set == null ) {
            return null;
        }

        Set<String> set1 = new HashSet<String>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( EnumInspection enumInspection : set ) {
            set1.add( enumInspectionMapper.toString( enumInspection ) );
        }

        return set1;
    }

    protected Set<TransactionProductDTO> transactionProductSetToTransactionProductDTOSet(Set<TransactionProduct> set) {
        if ( set == null ) {
            return null;
        }

        Set<TransactionProductDTO> set1 = new HashSet<TransactionProductDTO>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( TransactionProduct transactionProduct : set ) {
            set1.add( transactionProductMapper.toDTO( transactionProduct ) );
        }

        return set1;
    }

    protected Set<MovePathDTO> movePathSetToMovePathDTOSet(Set<MovePath> set) {
        if ( set == null ) {
            return null;
        }

        Set<MovePathDTO> set1 = new HashSet<MovePathDTO>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( MovePath movePath : set ) {
            set1.add( movePathMapper.toDTO( movePath ) );
        }

        return set1;
    }

    protected Set<CommentDTO> commentSetToCommentDTOSet(Set<Comment> set) {
        if ( set == null ) {
            return null;
        }

        Set<CommentDTO> set1 = new HashSet<CommentDTO>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( Comment comment : set ) {
            set1.add( commentMapper.toDTO( comment ) );
        }

        return set1;
    }

    protected Set<WarrantyHistoryDTO> warrantyHistorySetToWarrantyHistoryDTOSet(Set<WarrantyHistory> set) {
        if ( set == null ) {
            return null;
        }

        Set<WarrantyHistoryDTO> set1 = new HashSet<WarrantyHistoryDTO>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( WarrantyHistory warrantyHistory : set ) {
            set1.add( warrantyHistoryMapper.toDTO( warrantyHistory ) );
        }

        return set1;
    }

    protected Customer transactionDTOToCustomer(TransactionDTO transactionDTO) {
        if ( transactionDTO == null ) {
            return null;
        }

        Customer customer = new Customer();

        customer.setName( transactionDTO.getCustomerName() );
        customer.setEmail( transactionDTO.getEmail() );
        customer.setContact( transactionDTO.getContact() );

        return customer;
    }

    protected Device transactionDTOToDevice(TransactionDTO transactionDTO) {
        if ( transactionDTO == null ) {
            return null;
        }

        Device device = new Device();

        device.setName( transactionDTO.getDevice() );
        device.setColor( transactionDTO.getColor() );
        device.setImei( transactionDTO.getImei() );
        device.setPasscode( transactionDTO.getPasscode() );

        return device;
    }

    protected Set<TransactionProduct> transactionProductDTOSetToTransactionProductSet(Set<TransactionProductDTO> set) {
        if ( set == null ) {
            return null;
        }

        Set<TransactionProduct> set1 = new HashSet<TransactionProduct>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( TransactionProductDTO transactionProductDTO : set ) {
            set1.add( transactionProductMapper.fromDTO( transactionProductDTO ) );
        }

        return set1;
    }

    protected Set<EnumInspection> stringSetToEnumInspectionSet(Set<String> set) {
        if ( set == null ) {
            return null;
        }

        Set<EnumInspection> set1 = new HashSet<EnumInspection>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( String string : set ) {
            set1.add( enumInspectionMapper.toEnum( string ) );
        }

        return set1;
    }

    protected Set<Comment> commentDTOSetToCommentSet(Set<CommentDTO> set) {
        if ( set == null ) {
            return null;
        }

        Set<Comment> set1 = new HashSet<Comment>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( CommentDTO commentDTO : set ) {
            set1.add( commentMapper.fromDTO( commentDTO ) );
        }

        return set1;
    }

    protected Set<WarrantyHistory> warrantyHistoryDTOSetToWarrantyHistorySet(Set<WarrantyHistoryDTO> set) {
        if ( set == null ) {
            return null;
        }

        Set<WarrantyHistory> set1 = new HashSet<WarrantyHistory>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( WarrantyHistoryDTO warrantyHistoryDTO : set ) {
            set1.add( warrantyHistoryMapper.fromDTO( warrantyHistoryDTO ) );
        }

        return set1;
    }

    protected Set<MovePath> movePathDTOSetToMovePathSet(Set<MovePathDTO> set) {
        if ( set == null ) {
            return null;
        }

        Set<MovePath> set1 = new HashSet<MovePath>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( MovePathDTO movePathDTO : set ) {
            set1.add( movePathMapper.fromDTO( movePathDTO ) );
        }

        return set1;
    }

    protected Customer createTransactionDTOToCustomer(CreateTransactionDTO createTransactionDTO) {
        if ( createTransactionDTO == null ) {
            return null;
        }

        Customer customer = new Customer();

        customer.setName( createTransactionDTO.getCustomerName() );
        customer.setEmail( createTransactionDTO.getEmail() );
        customer.setContact( createTransactionDTO.getContact() );

        return customer;
    }

    protected Device createTransactionDTOToDevice(CreateTransactionDTO createTransactionDTO) {
        if ( createTransactionDTO == null ) {
            return null;
        }

        Device device = new Device();

        device.setName( createTransactionDTO.getDevice() );
        device.setColor( createTransactionDTO.getColor() );
        device.setImei( createTransactionDTO.getImei() );
        device.setPasscode( createTransactionDTO.getPasscode() );

        return device;
    }

    protected Set<TransactionProduct> transactionProductDTOListToTransactionProductSet(List<TransactionProductDTO> list) {
        if ( list == null ) {
            return null;
        }

        Set<TransactionProduct> set = new HashSet<TransactionProduct>( Math.max( (int) ( list.size() / .75f ) + 1, 16 ) );
        for ( TransactionProductDTO transactionProductDTO : list ) {
            set.add( transactionProductMapper.fromDTO( transactionProductDTO ) );
        }

        return set;
    }

    protected Customer updateTransactionDTOToCustomer(UpdateTransactionDTO updateTransactionDTO) {
        if ( updateTransactionDTO == null ) {
            return null;
        }

        Customer customer = new Customer();

        customer.setName( updateTransactionDTO.getCustomerName() );
        customer.setEmail( updateTransactionDTO.getEmail() );
        customer.setContact( updateTransactionDTO.getContact() );

        return customer;
    }

    protected Device updateTransactionDTOToDevice(UpdateTransactionDTO updateTransactionDTO) {
        if ( updateTransactionDTO == null ) {
            return null;
        }

        Device device = new Device();

        device.setName( updateTransactionDTO.getDevice() );
        device.setColor( updateTransactionDTO.getColor() );
        device.setImei( updateTransactionDTO.getImei() );
        device.setPasscode( updateTransactionDTO.getPasscode() );

        return device;
    }
}
