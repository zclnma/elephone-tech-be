package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.domain.Employee;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE, uses = StoreMapper.class)
public interface EmployeeMapper {

    @Named("NoStore")
    @Mapping(target = "stores", ignore = true)
    Employee toDTONoStore(EmployeeDTO employeeDTO);


//    @Mapping(target = "stores", qualifiedByName = "NoEmployee")
    EmployeeDTO toDTO(Employee employee);

    Employee fromDTO(EmployeeDTO employeeDTO);
}
