package com.elephone.management.api;

import com.elephone.management.api.dto.BaseEnumDTO;
import com.elephone.management.domain.EnumGender;
import com.elephone.management.domain.EnumInspection;
import com.elephone.management.domain.EnumRole;
import com.elephone.management.domain.EnumTransactionStatus;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/v1/template")
@Api(tags = "Template management")
public class TemplateResource {

    @GetMapping("/gender")
    @ApiOperation(value = "Get genders", notes = "Get genders")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
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

    @GetMapping("/role")
    @ApiOperation(value = "Get available roles", notes = "Get available roles")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<List<BaseEnumDTO>> getRoles() {
        List<BaseEnumDTO> baseEnumDTOs = new ArrayList<>();
        for (EnumRole enumRole : EnumRole.values()) {
            BaseEnumDTO baseEnumDTO = BaseEnumDTO.builder()
                    .key(enumRole.getKey())
                    .displayName(enumRole.getDisplayName())
                    .build();
            baseEnumDTOs.add(baseEnumDTO);
        }
        return new ResponseEntity<>(baseEnumDTOs, HttpStatus.OK);
    }

    @GetMapping("/inspection")
    @ApiOperation(value = "Get available inspection", notes = "Get available inspection")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
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
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<List<BaseEnumDTO>> getTransactionStatus() {
        List<BaseEnumDTO> baseEnumDTOs = new ArrayList<>();
        for (EnumTransactionStatus transactionStatus : EnumTransactionStatus.values()) {
            BaseEnumDTO baseEnumDTO = BaseEnumDTO.builder()
                    .key(transactionStatus.getKey())
                    .displayName(transactionStatus.getDisplayName())
                    .build();
            baseEnumDTOs.add(baseEnumDTO);
        }
        return new ResponseEntity<>(baseEnumDTOs, HttpStatus.OK);
    }

}
