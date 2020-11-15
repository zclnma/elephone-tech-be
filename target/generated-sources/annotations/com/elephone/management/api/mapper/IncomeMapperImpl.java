package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.IncomeDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.domain.Income;
import java.util.Date;
import java.util.UUID;
import javax.annotation.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-15T17:18:20+1100",
    comments = "version: 1.4.1.Final, compiler: javac, environment: Java 1.8.0_211 (Oracle Corporation)"
)
@Component
public class IncomeMapperImpl implements IncomeMapper {

    @Autowired
    private StoreMapper storeMapper;

    @Override
    public IncomeDTO toDTO(Income income) {
        if ( income == null ) {
            return null;
        }

        UUID id = null;
        Integer cash = null;
        Integer efpos = null;
        Date createdDate = null;
        StoreDTO store = null;

        id = income.getId();
        cash = income.getCash();
        efpos = income.getEfpos();
        createdDate = income.getCreatedDate();
        store = storeMapper.toDTO( income.getStore() );

        IncomeDTO incomeDTO = new IncomeDTO( id, cash, efpos, createdDate, store );

        return incomeDTO;
    }

    @Override
    public Income fromDTO(IncomeDTO incomeDTO) {
        if ( incomeDTO == null ) {
            return null;
        }

        Income income = new Income();

        income.setId( incomeDTO.getId() );
        income.setCash( incomeDTO.getCash() );
        income.setEfpos( incomeDTO.getEfpos() );
        income.setStore( storeMapper.fromDTO( incomeDTO.getStore() ) );
        income.setCreatedDate( incomeDTO.getCreatedDate() );

        return income;
    }
}
