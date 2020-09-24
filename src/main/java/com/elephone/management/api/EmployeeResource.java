package com.elephone.management.api;

import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.api.mapper.EmployeeDTOMapper;
import com.elephone.management.domain.Employee;
import com.elephone.management.service.EmployeeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/employee")
@Api(tags = "Employee Management")
//@PreAuthorize("hasAuthority('ADMIN')")
public class EmployeeResource {

    private EmployeeService employeeService;
    private EmployeeDTOMapper employeeDTOMapper;
    @Autowired
    public EmployeeResource (EmployeeService employeeService, EmployeeDTOMapper employeeDTOMapper) {
        this.employeeService = employeeService;
        this.employeeDTOMapper = employeeDTOMapper;
    }

    @GetMapping
    @ApiOperation(value = "List employees", notes = "List a number of employees")
    public ResponseEntity<List<EmployeeDTO>> list (
            @ApiParam(name = "page", defaultValue = "0") @RequestParam(name = "page", defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam(name = "perPage", defaultValue = "10") int perPage
    ) {
        Page<Employee> employees = employeeService.listEmployees(page, perPage);
        List<EmployeeDTO> dtoEmployees = employees.stream().map(employeeDTOMapper::toDTO).collect(Collectors.toList());
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Count", Long.toString(employees.getTotalElements()));
        return new ResponseEntity<>(dtoEmployees, headers, HttpStatus.OK);
    }

    @PostMapping
    @ApiOperation(value = "Create employee", notes = "Create Employee")
    public ResponseEntity<EmployeeDTO> create(@Valid @RequestBody EmployeeDTO employeeDTO) {
        Employee employee = employeeService.createEmployee(employeeDTOMapper.fromDTO(employeeDTO));
        return new ResponseEntity<>(employeeDTOMapper.toDTO(employee), HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "Get employee by id", notes = "Get employee by id")
    public ResponseEntity<EmployeeDTO> getById (@PathVariable UUID id) {
        Employee employee = employeeService.getEmployeeById(id);
        return new ResponseEntity<>(employeeDTOMapper.toDTO(employee), HttpStatus.OK);
    }

    @PutMapping
    @ApiOperation(value = "Update Employee", notes = "Update Employee")
    public ResponseEntity<EmployeeDTO> update (@Valid @RequestBody EmployeeDTO employeeDTO) {
        Employee employee = employeeService.updateEmployee(employeeDTOMapper.fromDTO(employeeDTO));
        return new ResponseEntity<>(employeeDTOMapper.toDTO(employee), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "Delete Employee by id", notes = "Delete Employee by id")
    public ResponseEntity<?> deleteById (@PathVariable UUID id) {
        employeeService.deleteEmployeeById(id);
        return new ResponseEntity<>(new HashMap<String, String>() {{
            put("message", "Employee: " + id + " has been deleted");
        }}, HttpStatus.ACCEPTED);
    }
}
