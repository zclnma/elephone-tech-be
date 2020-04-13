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
import java.util.List;
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
            @ApiParam(name = "page") @RequestParam(required = false, defaultValue = "0") Integer page,
            @ApiParam(name = "perPage") @RequestParam(required = false, defaultValue = "10") Integer perPage
    ) {
        Page<Store> stores = storeService.listStores(page, perPage);
        List<StoreDTO> dtoStores = stores.stream().map(storeDTOMapper::toStoreDTO).collect(Collectors.toList());
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Count", Long.toString(stores.getTotalElements()));
        return new ResponseEntity<>(dtoStores, headers, HttpStatus.OK);
    }

    @PostMapping
    @ApiOperation(value = "Create store", notes = "Create a store")
    public ResponseEntity<StoreDTO> create(@Valid @RequestBody StoreDTO storeDTO) {
        Store store =  storeService.createStore(storeDTOMapper.toStore(storeDTO));
        return new ResponseEntity<>(storeDTOMapper.toStoreDTO(store), HttpStatus.CREATED);
    }
}
