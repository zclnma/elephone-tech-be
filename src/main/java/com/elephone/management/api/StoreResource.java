package com.elephone.management.api;

import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.api.mapper.StoreDTOMapper;
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
    private final StoreDTOMapper storeDTOMapper;

    @Autowired
    public StoreResource(final StoreService storeService, final StoreDTOMapper storeDTOMapper) {
        this.storeService = storeService;
        this.storeDTOMapper = storeDTOMapper;
    }

    @GetMapping
    @ApiOperation(value = "List stores", notes = "List a number of tickets.")
    public ResponseEntity<List<StoreDTO>> list(
            @ApiParam(name = "page", required = false, defaultValue = "0") @RequestParam(required = false, defaultValue = "0") int page,
            @ApiParam(name = "perPage", required = false, defaultValue = "10") @RequestParam(required = false, defaultValue = "10") int perPage
    ) {
        Page<Store> stores = storeService.listStores(page, perPage);
        List<StoreDTO> dtoStores = stores.stream().map(storeDTOMapper::toDTO).collect(Collectors.toList());
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Count", Long.toString(stores.getTotalElements()));
        return new ResponseEntity<>(dtoStores, headers, HttpStatus.OK);
    }

    @PostMapping
    @ApiOperation(value = "Create store", notes = "Create a store")
    public ResponseEntity<StoreDTO> create(@Valid @RequestBody StoreDTO storeDTO) {
        Store store = storeService.createStore(storeDTOMapper.fromDTO(storeDTO));
        return new ResponseEntity<>(storeDTOMapper.toDTO(store), HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "Get store by store id", notes = "Get store by store id")
    public ResponseEntity<StoreDTO> getById(@PathVariable UUID id) {
        return new ResponseEntity<>(storeDTOMapper.toDTO(storeService.getStoreById(id)), HttpStatus.OK);
    }

    @PutMapping
    @ApiOperation(value = "Modify store", notes = "Modify store by store id")
    public ResponseEntity<StoreDTO> updateById(@Valid @RequestBody StoreDTO storeDTO) {
        Store store = storeService.updateStoreById(storeDTOMapper.fromDTO(storeDTO));
        return new ResponseEntity<>(storeDTOMapper.toDTO(store), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "Delete store by store id", notes = "Modify store by store id")
    public ResponseEntity<?> deleteById(@PathVariable UUID id) {
        storeService.deleteStoreById(id);
        return new ResponseEntity<>(new HashMap<String, String>() {{
            put("message", "Store: " + id + " has been deleted");
        }}, HttpStatus.ACCEPTED);
    }

}
