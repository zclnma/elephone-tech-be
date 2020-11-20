package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.Comment;
import com.elephone.management.domain.Employee;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.Named;

import java.util.List;

@Mapper(config = MapstructConfig.class, uses = {StoreMapper.class, EnumGenderMapper.class, EnumRoleMapper.class})
public interface EmployeeMapper {

//    @Named("NoStore")
//    @Mapping(target = "stores", ignore = true)
//    EmployeeDTO toDTOIgnoreStore(Employee employees);
//
//    @Named("NoListStore")
//    @Mapping(target = "stores", ignore = true)
//    List<EmployeeDTO> toDTOIgnoreListStore(List<Employee> employees);

    EmployeeDTO toDTO(Employee employee);

    @Mappings({
            @Mapping(target = "isActive", constant = "true"),
            @Mapping(target = "isDeleted", constant = "false"),
    })
    Employee fromDTO(EmployeeDTO employeeDTO);
}
