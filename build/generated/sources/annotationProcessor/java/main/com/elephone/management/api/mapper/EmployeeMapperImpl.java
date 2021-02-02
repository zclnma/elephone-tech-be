package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CreateEmployeeDTO;
import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import javax.annotation.processing.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2021-02-02T23:54:17+1100",
    comments = "version: 1.4.1.Final, compiler: IncrementalProcessingEnvironment from gradle-language-java-6.7.1.jar, environment: Java 11.0.9.1 (Azul Systems, Inc.)"
)
@Component
public class EmployeeMapperImpl implements EmployeeMapper {

    @Autowired
    private StoreMapper storeMapper;
    @Autowired
    private EnumGenderMapper enumGenderMapper;
    @Autowired
    private EnumRoleMapper enumRoleMapper;

    @Override
    public EmployeeDTO toDTO(Employee employee) {
        if ( employee == null ) {
            return null;
        }

        Set<StoreDTO> stores = null;
        UUID id = null;
        String username = null;
        String firstName = null;
        String lastName = null;
        String gender = null;
        String birthday = null;
        String role = null;
        String contact = null;
        String email = null;
        String tfn = null;

        stores = storeSetToStoreDTOSet( employee.getStores() );
        id = employee.getId();
        username = employee.getUsername();
        firstName = employee.getFirstName();
        lastName = employee.getLastName();
        gender = enumGenderMapper.toString( employee.getGender() );
        birthday = employee.getBirthday();
        role = enumRoleMapper.toString( employee.getRole() );
        contact = employee.getContact();
        email = employee.getEmail();
        tfn = employee.getTfn();

        EmployeeDTO employeeDTO = new EmployeeDTO( id, username, firstName, lastName, gender, birthday, role, contact, email, tfn, stores );

        return employeeDTO;
    }

    @Override
    public Employee fromDTO(EmployeeDTO employeeDTO) {
        if ( employeeDTO == null ) {
            return null;
        }

        Employee employee = new Employee();

        employee.setId( employeeDTO.getId() );
        employee.setUsername( employeeDTO.getUsername() );
        employee.setFirstName( employeeDTO.getFirstName() );
        employee.setLastName( employeeDTO.getLastName() );
        employee.setGender( enumGenderMapper.toEnum( employeeDTO.getGender() ) );
        employee.setBirthday( employeeDTO.getBirthday() );
        employee.setContact( employeeDTO.getContact() );
        employee.setEmail( employeeDTO.getEmail() );
        employee.setTfn( employeeDTO.getTfn() );
        employee.setRole( enumRoleMapper.toEnum( employeeDTO.getRole() ) );
        employee.setStores( storeDTOSetToStoreSet( employeeDTO.getStores() ) );

        employee.setIsActive( true );
        employee.setIsDeleted( false );

        return employee;
    }

    @Override
    public Employee fromCreateDTO(CreateEmployeeDTO createEmployeeDTO) {
        if ( createEmployeeDTO == null ) {
            return null;
        }

        Employee employee = new Employee();

        employee.setId( createEmployeeDTO.getId() );
        employee.setUsername( createEmployeeDTO.getUsername() );
        employee.setFirstName( createEmployeeDTO.getFirstName() );
        employee.setLastName( createEmployeeDTO.getLastName() );
        employee.setGender( enumGenderMapper.toEnum( createEmployeeDTO.getGender() ) );
        employee.setBirthday( createEmployeeDTO.getBirthday() );
        employee.setContact( createEmployeeDTO.getContact() );
        employee.setEmail( createEmployeeDTO.getEmail() );
        employee.setTfn( createEmployeeDTO.getTfn() );
        employee.setRole( enumRoleMapper.toEnum( createEmployeeDTO.getRole() ) );

        employee.setIsActive( true );
        employee.setIsDeleted( false );

        return employee;
    }

    protected Set<StoreDTO> storeSetToStoreDTOSet(Set<Store> set) {
        if ( set == null ) {
            return null;
        }

        Set<StoreDTO> set1 = new HashSet<StoreDTO>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( Store store : set ) {
            set1.add( storeMapper.toDTO( store ) );
        }

        return set1;
    }

    protected Set<Store> storeDTOSetToStoreSet(Set<StoreDTO> set) {
        if ( set == null ) {
            return null;
        }

        Set<Store> set1 = new HashSet<Store>( Math.max( (int) ( set.size() / .75f ) + 1, 16 ) );
        for ( StoreDTO storeDTO : set ) {
            set1.add( storeMapper.fromDTO( storeDTO ) );
        }

        return set1;
    }
}
