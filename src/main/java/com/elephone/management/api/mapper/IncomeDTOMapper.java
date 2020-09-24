package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.IncomeDTO;
import com.elephone.management.domain.Income;
import com.elephone.management.domain.Store;
import org.springframework.stereotype.Component;

@Component
public class IncomeDTOMapper {

    public IncomeDTO toDTO (Income income) {
        if (income == null) {
            return null;
        }

        IncomeDTO incomeDTO = new IncomeDTO();
        incomeDTO.setId(income.getId());
        incomeDTO.setCreatedDate(income.getCreatedDate());
        incomeDTO.setCash(income.getCash());
        incomeDTO.setEfpos(income.getEfpos());
        incomeDTO.setStoreId(income.getStore().getId());

        return incomeDTO;
    }

    public Income fromDTO(IncomeDTO incomeDTO) {
        if(incomeDTO == null) {
            return null;
        }

        Income income = new Income();
        income.setCash(incomeDTO.getCash());
        income.setEfpos(incomeDTO.getEfpos());
        income.setId(incomeDTO.getId());
        if(incomeDTO.getStoreId() != null) {
            income.setStore(Store.builder().id(incomeDTO.getStoreId()).build());
        }

        return income;
    }

}
