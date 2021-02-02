package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.api.dto.WarrantyHistoryDTO;
import com.elephone.management.domain.WarrantyHistory;
import java.util.UUID;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2021-02-02T23:54:17+1100",
    comments = "version: 1.4.1.Final, compiler: IncrementalProcessingEnvironment from gradle-language-java-6.7.1.jar, environment: Java 11.0.9.1 (Azul Systems, Inc.)"
)
@Component
public class WarrantyHistoryMapperImpl implements WarrantyHistoryMapper {

    @Override
    public WarrantyHistoryDTO toDTO(WarrantyHistory warrantyHistory) {
        if ( warrantyHistory == null ) {
            return null;
        }

        UUID id = null;
        String description = null;

        id = warrantyHistory.getId();
        description = warrantyHistory.getDescription();

        StoreDTO storeDTO = null;
        EmployeeDTO employeeDTO = null;

        WarrantyHistoryDTO warrantyHistoryDTO = new WarrantyHistoryDTO( id, description, storeDTO, employeeDTO );

        return warrantyHistoryDTO;
    }

    @Override
    public WarrantyHistory fromDTO(WarrantyHistoryDTO warrantyHistoryDTO) {
        if ( warrantyHistoryDTO == null ) {
            return null;
        }

        WarrantyHistory warrantyHistory = new WarrantyHistory();

        warrantyHistory.setId( warrantyHistoryDTO.getId() );
        warrantyHistory.setDescription( warrantyHistoryDTO.getDescription() );

        return warrantyHistory;
    }
}
