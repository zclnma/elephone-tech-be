package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.IncomeDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.Income;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(config = MapstructConfig.class, uses = StoreMapper.class)
public interface IncomeMapper {
    IncomeDTO toDTO(Income income);

    Income fromDTO(IncomeDTO incomeDTO);
}
