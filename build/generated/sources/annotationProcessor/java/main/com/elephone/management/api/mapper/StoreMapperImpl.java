package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CreateStoreDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.domain.Store;
import java.util.Date;
import java.util.UUID;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2021-02-02T23:54:17+1100",
    comments = "version: 1.4.1.Final, compiler: IncrementalProcessingEnvironment from gradle-language-java-6.7.1.jar, environment: Java 11.0.9.1 (Azul Systems, Inc.)"
)
@Component
public class StoreMapperImpl implements StoreMapper {

    @Override
    public StoreDTO toDTO(Store store) {
        if ( store == null ) {
            return null;
        }

        UUID id = null;
        String contact = null;
        String name = null;
        String companyName = null;
        String abn = null;
        Integer warranty = null;
        String address = null;
        String suburb = null;
        String state = null;
        String postcode = null;
        String email = null;
        Boolean isDeleted = null;
        Date deletedAt = null;

        id = store.getId();
        contact = store.getContact();
        name = store.getName();
        companyName = store.getCompanyName();
        abn = store.getAbn();
        warranty = store.getWarranty();
        address = store.getAddress();
        suburb = store.getSuburb();
        state = store.getState();
        postcode = store.getPostcode();
        email = store.getEmail();
        isDeleted = store.getIsDeleted();
        deletedAt = store.getDeletedAt();

        StoreDTO storeDTO = new StoreDTO( id, contact, name, companyName, abn, warranty, address, suburb, state, postcode, email, isDeleted, deletedAt );

        return storeDTO;
    }

    @Override
    public Store fromDTO(StoreDTO store) {
        if ( store == null ) {
            return null;
        }

        Store store1 = new Store();

        store1.setId( store.getId() );
        store1.setName( store.getName() );
        store1.setCompanyName( store.getCompanyName() );
        store1.setContact( store.getContact() );
        store1.setAbn( store.getAbn() );
        store1.setEmail( store.getEmail() );
        store1.setAddress( store.getAddress() );
        store1.setSuburb( store.getSuburb() );
        store1.setState( store.getState() );
        store1.setPostcode( store.getPostcode() );
        store1.setWarranty( store.getWarranty() );
        store1.setDeletedAt( store.getDeletedAt() );

        store1.setIsDeleted( false );

        return store1;
    }

    @Override
    public Store fromCreateDTO(CreateStoreDTO createStoreDTO) {
        if ( createStoreDTO == null ) {
            return null;
        }

        Store store = new Store();

        store.setId( createStoreDTO.getId() );
        store.setName( createStoreDTO.getName() );
        store.setCompanyName( createStoreDTO.getCompanyName() );
        store.setContact( createStoreDTO.getContact() );
        store.setAbn( createStoreDTO.getAbn() );
        store.setEmail( createStoreDTO.getEmail() );
        store.setAddress( createStoreDTO.getAddress() );
        store.setSuburb( createStoreDTO.getSuburb() );
        store.setState( createStoreDTO.getState() );
        store.setPostcode( createStoreDTO.getPostcode() );
        store.setWarranty( createStoreDTO.getWarranty() );

        store.setIsDeleted( false );

        return store;
    }
}
