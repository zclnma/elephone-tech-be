package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.MovePathDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.domain.MovePath;
import java.util.Date;
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
public class MovePathMapperImpl implements MovePathMapper {

    @Autowired
    private StoreMapper storeMapper;

    @Override
    public MovePath fromDTO(MovePathDTO movePathDTO) {
        if ( movePathDTO == null ) {
            return null;
        }

        MovePath movePath = new MovePath();

        movePath.setId( movePathDTO.getId() );
        movePath.setStore( storeMapper.fromDTO( movePathDTO.getStore() ) );
        movePath.setCreatedDate( movePathDTO.getCreatedDate() );

        return movePath;
    }

    @Override
    public MovePathDTO toDTO(MovePath movePath) {
        if ( movePath == null ) {
            return null;
        }

        UUID id = null;
        StoreDTO store = null;
        Date createdDate = null;

        id = movePath.getId();
        store = storeMapper.toDTO( movePath.getStore() );
        createdDate = movePath.getCreatedDate();

        MovePathDTO movePathDTO = new MovePathDTO( id, store, createdDate );

        return movePathDTO;
    }
}
