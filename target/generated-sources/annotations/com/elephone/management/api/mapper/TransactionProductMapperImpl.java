package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionProductDTO;
import com.elephone.management.domain.TransactionProduct;
import javax.annotation.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-27T15:36:59+1100",
    comments = "version: 1.4.1.Final, compiler: javac, environment: Java 11.0.4 (Oracle Corporation)"
)
@Component
public class TransactionProductMapperImpl implements TransactionProductMapper {

    @Override
    public TransactionProduct fromDTO(TransactionProductDTO transactionProductDTO) {
        if ( transactionProductDTO == null ) {
            return null;
        }

        TransactionProduct transactionProduct = new TransactionProduct();

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

        TransactionProductDTO transactionProductDTO = new TransactionProductDTO();

        transactionProductDTO.setNumber( transactionProduct.getNumber() );
        transactionProductDTO.setPrice( transactionProduct.getPrice() );
        transactionProductDTO.setDescription( transactionProduct.getDescription() );

        return transactionProductDTO;
    }
}
