package com.elephone.management.api;

import com.elephone.management.api.dto.BaseEnumDTO;
import com.elephone.management.api.dto.TransactionStatusDTO;
import com.elephone.management.api.dto.TransactionStatusGroupDTO;
import com.elephone.management.api.mapper.TransactionStatusMapper;
import com.elephone.management.domain.*;
import com.elephone.management.service.AuthService;
import com.elephone.management.service.TransactionStatusGroupService;
import com.elephone.management.service.TransactionStatusService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/template")
@Api(tags = "Template management")
public class TemplateResource {

    private final AuthService authService;
    private final TransactionStatusService transactionStatusService;
    private final TransactionStatusMapper transactionStatusMapper;

    @Autowired
    public TemplateResource(AuthService authService, TransactionStatusService transactionStatusService, TransactionStatusMapper transactionStatusMapper) {
        this.authService = authService;
        this.transactionStatusService = transactionStatusService;
        this.transactionStatusMapper = transactionStatusMapper;
    }

    @GetMapping("/gender")
    @ApiOperation(value = "Get genders", notes = "Get genders")
    @PreAuthorize("hasAnyAuthority('OWNER','ADMIN','USER')")
    public ResponseEntity<List<BaseEnumDTO>> getGenders() {
        List<BaseEnumDTO> baseEnumDTOS = new ArrayList<>();
        for (EnumGender inspection : EnumGender.values()) {
            BaseEnumDTO baseEnumDTO = BaseEnumDTO.builder()
                    .key(inspection.getKey())
                    .displayName(inspection.getDisplayName())
                    .build();
            baseEnumDTOS.add(baseEnumDTO);
        }
        return new ResponseEntity<>(baseEnumDTOS, HttpStatus.OK);
    }

    @GetMapping("/inspection")
    @ApiOperation(value = "Get available inspection", notes = "Get available inspection")
    @PreAuthorize("hasAnyAuthority('OWNER','ADMIN','USER')")
    public ResponseEntity<List<BaseEnumDTO>> getInspections() {
        List<BaseEnumDTO> baseEnumDTOS = new ArrayList<>();
        for (EnumInspection inspection : EnumInspection.values()) {
            BaseEnumDTO baseEnumDTO = BaseEnumDTO.builder()
                    .key(inspection.getKey())
                    .displayName(inspection.getDisplayName())
                    .build();
            baseEnumDTOS.add(baseEnumDTO);
        }
        return new ResponseEntity<>(baseEnumDTOS, HttpStatus.OK);
    }

    @GetMapping("/status")
    @ApiOperation(value = "Get available status", notes = "Get available status")
    @PreAuthorize("hasAnyAuthority('OWNER','ADMIN','USER')")
    public ResponseEntity<List<TransactionStatusDTO>> getTransactionStatus() {
        List<TransactionStatus> transactionStatuses = transactionStatusService.list();
        List<TransactionStatusDTO> transactionStatusDTOS = transactionStatuses.stream().map(transactionStatusMapper::toDTO).collect(Collectors.toList());
        return new ResponseEntity<>(transactionStatusDTOS, HttpStatus.OK);
    }

    @GetMapping("/role")
    @ApiOperation(value = "Get available roles", notes = "Get available roles")
    @PreAuthorize("hasAnyAuthority('OWNER','ADMIN')")
    public ResponseEntity<List<BaseEnumDTO>> getRoles() {
        List<BaseEnumDTO> baseEnumDTOs = new ArrayList<>();
        List<String> authorities = authService.getAuthorities();
        for (EnumRole enumRole : EnumRole.values()) {
            if (enumRole.equals(EnumRole.ADMIN) && !authorities.contains("OWNER")) {
                continue;
            }
            BaseEnumDTO baseEnumDTO = BaseEnumDTO.builder()
                    .key(enumRole.getKey())
                    .displayName(enumRole.getDisplayName())
                    .build();
            baseEnumDTOs.add(baseEnumDTO);
        }
        return new ResponseEntity<>(baseEnumDTOs, HttpStatus.OK);
    }

}
