package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.IncomeDTO;
import com.elephone.management.domain.Income;
import com.elephone.management.domain.Store;
import org.springframework.stereotype.Component;

@Component
public class IncomeDTOMapper {

    public IncomeDTO toDTO(Income income) {
        if (income == null) {
            return null;
        }

        return IncomeDTO.builder()
                .id(income.getId())
                .createdDate(income.getCreatedDate())
                .cash(income.getCash())
                .efpos(income.getEfpos())
                .storeId(income.getStore().getId())
                .build();
    }

    public Income fromDTO(IncomeDTO incomeDTO) {
        if (incomeDTO == null) {
            return null;
        }

        return Income.builder()
                .cash(incomeDTO.getCash())
                .efpos(incomeDTO.getEfpos())
                .id(incomeDTO.getId())
                .store(incomeDTO.getStoreId() == null ? null : Store.builder().id(incomeDTO.getStoreId()).build())
                .build();
    }

}
