package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.annotation.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2020-11-27T12:28:38+1100",
    comments = "version: 1.4.1.Final, compiler: javac, environment: Java 1.8.0_211 (Oracle Corporation)"
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

        List<StoreDTO> stores = null;
        UUID id = null;
        UUID cognitoId = null;
        String username = null;
        String firstName = null;
        String lastName = null;
        String gender = null;
        String birthday = null;
        String role = null;
        String contact = null;
        String email = null;
        String tfn = null;

        stores = storeListToStoreDTOList( employee.getStores() );
        id = employee.getId();
        cognitoId = employee.getCognitoId();
        username = employee.getUsername();
        firstName = employee.getFirstName();
        lastName = employee.getLastName();
        gender = enumGenderMapper.toString( employee.getGender() );
        birthday = employee.getBirthday();
        role = enumRoleMapper.toString( employee.getRole() );
        contact = employee.getContact();
        email = employee.getEmail();
        tfn = employee.getTfn();

        String password = null;

        EmployeeDTO employeeDTO = new EmployeeDTO( id, password, cognitoId, username, firstName, lastName, gender, birthday, role, contact, email, tfn, stores );

        return employeeDTO;
    }

    @Override
    public Employee fromDTO(EmployeeDTO employeeDTO) {
        if ( employeeDTO == null ) {
            return null;
        }

        Employee employee = new Employee();

        employee.setId( employeeDTO.getId() );
        employee.setCognitoId( employeeDTO.getCognitoId() );
        employee.setUsername( employeeDTO.getUsername() );
        employee.setFirstName( employeeDTO.getFirstName() );
        employee.setLastName( employeeDTO.getLastName() );
        employee.setGender( enumGenderMapper.toEnum( employeeDTO.getGender() ) );
        employee.setBirthday( employeeDTO.getBirthday() );
        employee.setContact( employeeDTO.getContact() );
        employee.setEmail( employeeDTO.getEmail() );
        employee.setTfn( employeeDTO.getTfn() );
        employee.setRole( enumRoleMapper.toEnum( employeeDTO.getRole() ) );
        employee.setStores( storeDTOListToStoreList( employeeDTO.getStores() ) );

        employee.setIsActive( true );
        employee.setIsDeleted( false );

        return employee;
    }

    protected List<StoreDTO> storeListToStoreDTOList(List<Store> list) {
        if ( list == null ) {
            return null;
        }

        List<StoreDTO> list1 = new ArrayList<StoreDTO>( list.size() );
        for ( Store store : list ) {
            list1.add( storeMapper.toDTO( store ) );
        }

        return list1;
    }

    protected List<Store> storeDTOListToStoreList(List<StoreDTO> list) {
        if ( list == null ) {
            return null;
        }

        List<Store> list1 = new ArrayList<Store>( list.size() );
        for ( StoreDTO storeDTO : list ) {
            list1.add( storeMapper.fromDTO( storeDTO ) );
        }

        return list1;
    }
}
