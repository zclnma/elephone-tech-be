package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.domain.Store;
import com.elephone.management.domain.Store.StoreBuilder;
import java.util.UUID;
import javax.annotation.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-20T18:33:26+1100",
    comments = "version: 1.4.1.Final, compiler: javac, environment: Java 1.8.0_211 (Oracle Corporation)"
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

        id = store.getId();
        contact = store.getContact();
        name = store.getName();
        abn = store.getAbn();
        sequence = store.getSequence();
        warranty = store.getWarranty();

        StoreDTO storeDTO = new StoreDTO( id, contact, name, abn, sequence, warranty );

        return storeDTO;
    }

    @Override
    public Store fromDTO(StoreDTO store) {
        if ( store == null ) {
            return null;
        }

        StoreBuilder store1 = Store.builder();

        store1.id( store.getId() );
        store1.name( store.getName() );
        store1.contact( store.getContact() );
        store1.abn( store.getAbn() );
        store1.sequence( store.getSequence() );
        store1.warranty( store.getWarranty() );

        store1.isDeleted( false );

        return store1.build();
    }
}
