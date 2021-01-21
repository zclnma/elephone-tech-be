package com.elephone.management.api;

import com.elephone.management.api.dto.CreateEmployeeDTO;
import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.api.dto.UpdateEmployeeDTO;
import com.elephone.management.api.mapper.EmployeeMapper;
import com.elephone.management.domain.Employee;
import com.elephone.management.service.CognitoService;
import com.elephone.management.service.EmployeeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/employee")
@Api(tags = "Employee Management")
public class EmployeeResource {

    private EmployeeService employeeService;
    private EmployeeMapper employeeMapper;

    @Autowired
    public EmployeeResource(EmployeeService employeeService, EmployeeMapper employeeMapper) {
        this.employeeService = employeeService;
        this.employeeMapper = employeeMapper;
    }

    @GetMapping
    @ApiOperation(value = "List employees", notes = "List a number of employees")
    @PreAuthorize("hasAnyAuthority('OWNER','ADMIN','USER')")
    public ResponseEntity<List<EmployeeDTO>> list(
            @ApiParam(name = "page", defaultValue = "0") @RequestParam(name = "page", defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam(name = "perPage", defaultValue = "10") int perPage,
            @ApiParam(name = "storeId", required = false) @RequestParam(name = "storeId", required = false) String storeId
    ) {
        Page<Employee> employees = employeeService.listEmployees(page, perPage, storeId);
        List<EmployeeDTO> dtoEmployees = employees.stream().map(employeeMapper::toDTO).collect(Collectors.toList());
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Count", Long.toString(employees.getTotalElements()));
        return new ResponseEntity<>(dtoEmployees, headers, HttpStatus.OK);
    }

    @PostMapping
    @ApiOperation(value = "Create employee", notes = "Create Employee")
    public ResponseEntity<EmployeeDTO> create(@Valid @RequestBody CreateEmployeeDTO createEmployeeDTO) {
        Employee employee = employeeService.createEmployee(createEmployeeDTO);
        return new ResponseEntity<>(employeeMapper.toDTO(employee), HttpStatus.CREATED);
    }

    @GetMapping("/{uniqueId}")
    @ApiOperation(value = "Get store by store id or name", notes = "Get store by store id or name")
    @PreAuthorize("hasAnyAuthority('OWNER','ADMIN','USER')")
    public ResponseEntity<EmployeeDTO> getById(@PathVariable String uniqueId, @CurrentSecurityContext SecurityContext context) {
        String[] split = uniqueId.split("_");
        String type = split[0];
        UUID uuid = UUID.fromString(split[1]);
        return new ResponseEntity<>(employeeMapper.toDTO(employeeService.getEmployeeByUniqueId(type, uuid)), HttpStatus.OK);
    }

    @PutMapping("/{id}/activate")
    @ApiOperation(value = "Activate employee", notes = "Activate employee")
    @PreAuthorize("hasAnyAuthority('OWNER','ADMIN','USER')")
    public ResponseEntity<EmployeeDTO> activateEmployee(@PathVariable UUID id) {
        Employee employee = employeeService.activateEmployeeById(id);
        return new ResponseEntity<>(employeeMapper.toDTO(employee), HttpStatus.OK);
    }

    @PutMapping("/{id}/deactivate")
    @ApiOperation(value = "Deactivate employee", notes = "Deactivate employee")
    @PreAuthorize("hasAnyAuthority('OWNER','ADMIN','USER')")
    public ResponseEntity<EmployeeDTO> deActivateEmployee(@PathVariable UUID id) {
        Employee employee = employeeService.deActivateEmployeeById(id);
        return new ResponseEntity<>(employeeMapper.toDTO(employee), HttpStatus.OK);
    }

    @PutMapping
    @ApiOperation(value = "Update Employee", notes = "Update Employee")
    @PreAuthorize("hasAnyAuthority('ADMIN','OWNER')")
    public ResponseEntity<EmployeeDTO> update(@Valid @RequestBody UpdateEmployeeDTO updateEmployeeDTO) {
        Employee employee = employeeService.updateEmployee(updateEmployeeDTO);
        return new ResponseEntity<>(employeeMapper.toDTO(employee), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "Delete Employee by id", notes = "Delete Employee by id")
    @PreAuthorize("hasAnyAuthority('OWNER')")
    public ResponseEntity<?> deleteById(@PathVariable UUID id) {
        employeeService.deleteEmployeeById(id);
        return new ResponseEntity<>(new HashMap<String, String>() {{
            put("message", "Employee: " + id + " has been deleted");
        }}, HttpStatus.ACCEPTED);
    }
}
