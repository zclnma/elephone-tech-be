package com.elephone.management.api;

import com.elephone.management.api.dto.IncomeDTO;
import com.elephone.management.api.mapper.IncomeMapper;
import com.elephone.management.domain.Income;
import com.elephone.management.service.IncomeService;
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
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/income")
@Api(tags = "Income management")
@PreAuthorize("hasAuthority('ADMIN')")
public class IncomeResource {

    private IncomeService incomeService;
    private IncomeMapper incomeMapper;

    @Autowired
    public IncomeResource(IncomeService incomeService, IncomeMapper incomeMapper) {
        this.incomeService = incomeService;
        this.incomeMapper = incomeMapper;
    }

    @GetMapping("/{storeId}")
    @ApiOperation(value = "List income of a store", notes = "List income of a store")
    public ResponseEntity<List<IncomeDTO>> listByStoreId(
            @PathVariable UUID storeId,
            @ApiParam(name = "page", defaultValue = "0") @RequestParam(name = "page", defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam(name = "perPage", defaultValue = "10") int perPage) {

        Page<Income> incomes = incomeService.listIncomesByStoreId(storeId, page, perPage);
        List<IncomeDTO> incomeDTOS = incomes.stream().map(incomeMapper::toDTO).collect(Collectors.toList());
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("X-Total-Count", Long.toString(incomes.getTotalElements()));
        return new ResponseEntity<>(incomeDTOS, httpHeaders, HttpStatus.OK);
    }

    @GetMapping
    @ApiOperation(value = "List all incomes by id", notes = "List all incomes by id")
    public ResponseEntity<List<IncomeDTO>> list(
            @ApiParam(name = "page", defaultValue = "0") @RequestParam(name = "page", defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam(name = "perPage", defaultValue = "10") int perPage
    ) {
        Page<Income> incomes = incomeService.listIncomes(page, perPage);
        List<IncomeDTO> incomeDTOS = incomes.stream().map(incomeMapper::toDTO).collect(Collectors.toList());
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("X-Total-Count", Long.toString(incomes.getTotalElements()));
        return new ResponseEntity<>(incomeDTOS, httpHeaders, HttpStatus.OK);
    }

    @PostMapping
    @ApiOperation(value = "Create Income", notes = "Create Income")
    public ResponseEntity<IncomeDTO> create(@Valid @RequestBody IncomeDTO incomeDTO) {
        Income income = incomeService.createIncome(incomeMapper.fromDTO(incomeDTO));
        return new ResponseEntity<>(incomeMapper.toDTO(income), HttpStatus.CREATED);
    }

}
