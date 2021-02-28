package com.elephone.management.api;

import com.elephone.management.api.dto.CreateStoreDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.api.mapper.StoreMapper;
import com.elephone.management.domain.Store;
import com.elephone.management.service.StoreService;
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
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/store")
@Api(tags = "Store Management")
public class StoreResource {

    private final StoreService storeService;
    private final StoreMapper storeMapper;

    @Autowired
    public StoreResource(StoreService storeService, StoreMapper storeMapper) {
        this.storeService = storeService;
        this.storeMapper = storeMapper;
    }

    @GetMapping
    @ApiOperation(value = "List stores", notes = "List a number of tickets.")
    @PreAuthorize("hasAnyAuthority('ADMIN','OWNER')")
    public ResponseEntity<List<StoreDTO>> list(
            @ApiParam(name = "page", defaultValue = "0") @RequestParam(required = false, defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam(required = false, defaultValue = "10") int perPage,
            @ApiParam(name = "isDeleted") @RequestParam(required = false) Boolean isDeleted
    ) {
        Page<Store> stores = storeService.listStores(page, perPage, isDeleted);
        List<StoreDTO> dtoStores = stores.stream().map(storeMapper::toDTO).collect(Collectors.toList());
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Count", Long.toString(stores.getTotalElements()));
        return new ResponseEntity<>(dtoStores, headers, HttpStatus.OK);
    }

    @PostMapping
    @ApiOperation(value = "Create store", notes = "Create a store")
    @PreAuthorize("hasAnyAuthority('OWNER')")
    public ResponseEntity<StoreDTO> create(@Valid @RequestBody CreateStoreDTO createStoreDTO) {
        Store store = storeService.createStore(storeMapper.fromCreateDTO(createStoreDTO));
        return new ResponseEntity<>(storeMapper.toDTO(store), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    @ApiOperation(value = "Modify store", notes = "Modify store by store id")
    @PreAuthorize("hasAnyAuthority('OWNER')")
    public ResponseEntity<StoreDTO> updateById(@Valid @RequestBody CreateStoreDTO createStoreDTO) {
        Store store = storeService.updateStore(storeMapper.fromCreateDTO(createStoreDTO));
        return new ResponseEntity<>(storeMapper.toDTO(store), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "Delete store by store id", notes = "Modify store by store id")
    @PreAuthorize("hasAnyAuthority('OWNER')")
    public ResponseEntity<?> deleteById(@PathVariable UUID id) {
        storeService.deleteStoreById(id);
        return new ResponseEntity<>(new HashMap<String, String>() {{
            put("message", "Store: " + id + " has been deleted");
        }}, HttpStatus.ACCEPTED);
    }
}

