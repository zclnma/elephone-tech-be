package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionProductDTO;
import com.elephone.management.domain.TransactionProduct;
import java.util.UUID;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2021-02-02T23:54:17+1100",
    comments = "version: 1.4.1.Final, compiler: IncrementalProcessingEnvironment from gradle-language-java-6.7.1.jar, environment: Java 11.0.9.1 (Azul Systems, Inc.)"
)
@Component
public class TransactionProductMapperImpl implements TransactionProductMapper {

    @Override
    public TransactionProduct fromDTO(TransactionProductDTO transactionProductDTO) {
        if ( transactionProductDTO == null ) {
            return null;
        }

        TransactionProduct transactionProduct = new TransactionProduct();

        transactionProduct.setId( transactionProductDTO.getId() );
        transactionProduct.setNumber( transactionProductDTO.getNumber() );
        transactionProduct.setPrice( transactionProductDTO.getPrice() );
        transactionProduct.setDescription( transactionProductDTO.getDescription() );

        return transactionProduct;
    }

    @Override
    public TransactionProductDTO toDTO(TransactionProduct transactionProduct) {
        if ( transactionProduct == null ) {
            return null;
        }

        UUID id = null;
        String number = null;
        String description = null;
        String price = null;

        id = transactionProduct.getId();
        number = transactionProduct.getNumber();
        description = transactionProduct.getDescription();
        price = transactionProduct.getPrice();

        TransactionProductDTO transactionProductDTO = new TransactionProductDTO( id, number, description, price );

        return transactionProductDTO;
    }
}
