package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.api.dto.CreateEmployeeDTO;
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

    EmployeeDTO toDTO(Employee employee);

    @Mappings({
            @Mapping(target = "isActive", constant = "true"),
            @Mapping(target = "isDeleted", constant = "false"),
    })
    Employee fromDTO(EmployeeDTO employeeDTO);

    @Mappings({
            @Mapping(target = "isActive", constant = "true"),
            @Mapping(target = "isDeleted", constant = "false"),
    })
    Employee fromCreateDTO(CreateEmployeeDTO createEmployeeDTO);
}
