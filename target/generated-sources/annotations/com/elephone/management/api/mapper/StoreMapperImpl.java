package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.domain.Store;
import java.util.UUID;
import javax.annotation.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-27T15:36:59+1100",
    comments = "version: 1.4.1.Final, compiler: javac, environment: Java 11.0.4 (Oracle Corporation)"
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
        String abn = null;
        String sequence = null;
        Integer warranty = null;
        String address = null;
        String email = null;

        id = store.getId();
        contact = store.getContact();
        name = store.getName();
        abn = store.getAbn();
        sequence = store.getSequence();
        warranty = store.getWarranty();
        address = store.getAddress();
        email = store.getEmail();

        StoreDTO storeDTO = new StoreDTO( id, contact, name, abn, sequence, warranty, address, email );

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
        store1.setContact( store.getContact() );
        store1.setAbn( store.getAbn() );
        store1.setEmail( store.getEmail() );
        store1.setAddress( store.getAddress() );
        store1.setSequence( store.getSequence() );
        store1.setWarranty( store.getWarranty() );

        store1.setIsDeleted( false );

        return store1;
    }
}
