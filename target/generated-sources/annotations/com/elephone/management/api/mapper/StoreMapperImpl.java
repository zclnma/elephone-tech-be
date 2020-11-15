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
    date = "2020-11-15T17:18:20+1100",
    comments = "version: 1.4.1.Final, compiler: javac, environment: Java 1.8.0_211 (Oracle Corporation)"
)
@Component
public class StoreMapperImpl implements StoreMapper {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public StoreDTO toDTO(Store store) {
        if ( store == null ) {
            return null;
        }

        UUID id = null;
        String contact = null;
        String name = null;
        String abn = null;
        String sequence = null;
        Integer warranty = null;

        id = store.getId();
        contact = store.getContact();
        name = store.getName();
        abn = store.getAbn();
        sequence = store.getSequence();
        warranty = store.getWarranty();

        List<EmployeeDTO> employees = null;

        StoreDTO storeDTO = new StoreDTO( id, contact, name, abn, sequence, warranty, employees );

        return storeDTO;
    }

    @Override
    public Store fromDTO(StoreDTO store) {
        if ( store == null ) {
            return null;
        }

        Store store1 = new Store();

        store1.setId( store.getId() );
        store1.setName( store.getName() );
        store1.setContact( store.getContact() );
        store1.setAbn( store.getAbn() );
        store1.setSequence( store.getSequence() );
        store1.setWarranty( store.getWarranty() );
        store1.setEmployees( employeeDTOListToEmployeeList( store.getEmployees() ) );

        return store1;
    }

    protected List<Employee> employeeDTOListToEmployeeList(List<EmployeeDTO> list) {
        if ( list == null ) {
            return null;
        }

        List<Employee> list1 = new ArrayList<Employee>( list.size() );
        for ( EmployeeDTO employeeDTO : list ) {
            list1.add( employeeMapper.fromDTO( employeeDTO ) );
        }

        return list1;
    }
}
