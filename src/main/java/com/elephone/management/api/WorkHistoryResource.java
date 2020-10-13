package com.elephone.management.api;

import com.elephone.management.api.dto.IncomeDTO;
import com.elephone.management.api.dto.WorkHistoryDTO;
import com.elephone.management.api.mapper.WorkHistoryMapper;
import com.elephone.management.domain.Income;
import com.elephone.management.domain.WorkHistory;
import com.elephone.management.service.WorkHistoryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/workHistory")
@Api(tags = "Work history management")
@PreAuthorize("hasAuthority('ADMIN')")
public class WorkHistoryResource {

    public WorkHistoryService workHistoryService;
    public WorkHistoryMapper workHistoryMapper;

    @Autowired
    public WorkHistoryResource(WorkHistoryService workHistoryService, WorkHistoryMapper workHistoryMapper) {
        this.workHistoryMapper = workHistoryMapper;
        this.workHistoryService = workHistoryService;
    }

    @GetMapping("/{employeeId}")
    @ApiOperation(value = "List work history by employee id", notes = "List work history by employee id")
    public ResponseEntity<List<WorkHistoryDTO>> listByEmployeeId(
            @PathVariable UUID employeeId,
            @ApiParam(name = "page", defaultValue = "0") @RequestParam(name = "page", defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam(name = "perPage", defaultValue = "10") int perPage
    ) {
        Page<WorkHistory> workHistories = workHistoryService.listWorkHistoryByStoreId(employeeId, page, perPage);
        List<WorkHistoryDTO> workHistoryDTOS = workHistories.map(workHistoryMapper::toDTO).toList();
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("X-Total-Count", Long.toString(workHistories.getTotalElements()));
        return new ResponseEntity<>(workHistoryDTOS, httpHeaders, HttpStatus.OK);
    }

    @GetMapping
    @ApiOperation(value = "List work history", notes = "List work history")
    public ResponseEntity<List<WorkHistoryDTO>> listByEmployeeId(
            @ApiParam(name = "page", defaultValue = "0") @RequestParam(name = "page", defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam(name = "perPage", defaultValue = "10") int perPage
    ) {
        Page<WorkHistory> workHistories = workHistoryService.listWorkHistory(page, perPage);
        List<WorkHistoryDTO> workHistoryDTOS = workHistories.map(workHistoryMapper::toDTO).toList();
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("X-Total-Count", Long.toString(workHistories.getTotalElements()));
        return new ResponseEntity<>(workHistoryDTOS, httpHeaders, HttpStatus.OK);
    }

    @PostMapping
    @ApiOperation(value = "Create work history ", notes = "Create work history")
    public ResponseEntity<WorkHistoryDTO> create(@Valid @RequestBody WorkHistoryDTO workHistoryDTO) {
        WorkHistory workHistory = workHistoryService.createWorkHistory(workHistoryMapper.fromDTO(workHistoryDTO));
        return new ResponseEntity<>(workHistoryMapper.toDTO(workHistory), HttpStatus.CREATED);
    }

    @PutMapping("/{employeeId}")
    @ApiOperation(value = "Update work history", notes = "Create work history")
    public ResponseEntity<WorkHistoryDTO> update(@PathVariable UUID employeeId) {
        WorkHistory workHistory = workHistoryService.updateWorkHistory(employeeId);
        return new ResponseEntity<>(workHistoryMapper.toDTO(workHistory), HttpStatus.OK);
    }
}
