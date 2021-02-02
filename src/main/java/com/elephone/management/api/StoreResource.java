package com.elephone.management.api;

import com.elephone.management.api.dto.CreateStoreDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.api.mapper.StoreMapper;
import com.elephone.management.domain.Store;
import com.elephone.management.service.EmployeeService;
import com.elephone.management.service.StoreService;
import com.elephone.management.service.TransactionService;
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

    private final TransactionService transactionService;
    private final EmployeeService employeeService;
    private final StoreService storeService;
    private final StoreMapper storeMapper;

    @Autowired
    public StoreResource(TransactionService transactionService, EmployeeService employeeService, StoreService storeService, StoreMapper storeMapper) {
        this.transactionService = transactionService;
        this.employeeService = employeeService;
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

//    @GetMapping(value = "/migration/{token}")
//    @ApiOperation(value = "Delete store by store id", notes = "Modify store by store id")
//    @PreAuthorize("hasAnyAuthority('OWNER','ADMIN','USER')")
//    public ResponseEntity<List<LegacyStore>> a(@PathVariable String token) {
//
//        String history = "https://elephone.tech/api/history/?page=0&perPage=10";
//        String job = "https://elephone.tech/api/job";
//        String store = "https://elephone.tech/api/store";
//        String staff = "https://elephone.tech/api/staff";
//
//        HttpHeaders headers = new HttpHeaders();
//        String realToken = "JWT " + token;
//        headers.set("Authorization", realToken);
//        HttpEntity entity = new HttpEntity(headers);
//        RestTemplate restTemplate = new RestTemplate();
//        ResponseEntity<List<LegacyStore>> stores = restTemplate.exchange(store, HttpMethod.GET, entity, new ParameterizedTypeReference<List<LegacyStore>>() {
//        });
//        ResponseEntity<List<LegacyEmployee>> employees = restTemplate.exchange(staff, HttpMethod.GET, entity, new ParameterizedTypeReference<List<LegacyEmployee>>() {
//        });
//        ResponseEntity<List<LegacyTransaction>> transaction = restTemplate.exchange(job, HttpMethod.GET, entity, new ParameterizedTypeReference<List<LegacyTransaction>>() {
//        });
//        ResponseEntity<ApiHistory> histories = restTemplate.exchange(history, HttpMethod.GET, entity, ApiHistory.class);
//
//        List<Store> ss = stores.getBody().stream().map(legacyStore -> {
//            Store newStore = Store.builder()
//                    .abn(legacyStore.getAbn())
//                    .name(legacyStore.getName())
//                    .sequence(legacyStore.getNumber())
//                    .warranty(legacyStore.getWarrenty() == null ? 90 : Integer.parseInt(legacyStore.getWarrenty()))
//                    .build();
//            return newStore;
//
//        }).collect(Collectors.toList());
//
//        List<Employee> ee = employees.getBody().stream().map(legacyEmployee -> Employee.builder()
//                .id(UUID.randomUUID())
//                .firstName(legacyEmployee.getFirstName())
//                .lastName(legacyEmployee.getLastName())
//                .contact(legacyEmployee.getNumber())
//                .birthday(legacyEmployee.getBirth())
//                .gender("Female".equalsIgnoreCase(legacyEmployee.getGender()) ? EnumGender.FEMALE : EnumGender.MALE)
//                .email(legacyEmployee.getEmail())
//                .tfn(legacyEmployee.getTfn())
//                .stores(new ArrayList<>())
//                .build()).collect(Collectors.toList());
//
//        storeService.createStoreBatch(ss);
//        employeeService.createEmployeeBatch(ee);
//
//        List<Store> savesStores = storeService.listStores(0, 1000).toList();
//        List<Employee> savedEmployee = employeeService.listEmployees(0, 1000).toList();
//        List<Store> sssss = ss.stream().map(anotherStore -> {
//            LegacyStore lS = stores.getBody().stream().filter(e -> e.get .equals(anotherStore.getId())).findAny().orElse(null);
//            Set<Employee> newEmployees = anotherStore.getEmployees().stream().map(anotherEmployee -> {
//                LegacyEmployee lE = employees.getBody().stream().filter(e ->
//                        e.get_id().equals(anotherEmployee.getId())
//                ).findAny().orElse(null);
//                if (lE != null) {
//                    Employee e = ee.stream().filter(eee -> eee.getFirstName().equals(lE.getFirstName())).findAny().orElse(null);
//                    if (e != null) {
//                        return Employee.builder().id(e.getId()).build();
//                    }
//                }
//                return anotherEmployee;
//            }).collect(Collectors.toSet());
//            anotherStore.setEmployees(newEmployees);
//            return anotherStore;
//        }).collect(Collectors.toList());
//
//        List<Employee> eeeee = ee.stream().map(anotherEmployee -> {
//            Set<Store> newEmployees = anotherEmployee.getStores().stream().map(anotherStore -> {
//                LegacyStore lS = stores.getBody().stream().filter(e -> e.get_id().equals(anotherStore.getId())).findAny().orElse(null);
//                if (lS != null) {
//                    Store s = ss.stream().filter(sss -> sss.getSequence().equals(lS.getNumber())).findAny().orElse(null);
//                    if (s != null) {
//                        return Store.builder().id(s.getId()).build();
//                    }
//                }
//                return anotherStore;
//            }).collect(Collectors.toSet());
//            anotherEmployee.setStores(newEmployees);
//            return anotherEmployee;
//        }).collect(Collectors.toList());
//
//
//        storeService.createStoreBatch(sssss);
//        employeeService.createEmployeeBatch(eeeee);
//
//
//        List<Transaction> tt = transaction.getBody().stream().map(legacyTransaction -> {
//
//            LegacyEmployee lE = employees.getBody().stream().filter(e -> e.get_id().equals(legacyTransaction.getCreatedBy())).findAny().orElse(null);
//            LegacyStore lS = stores.getBody().stream().filter(e -> e.get_id().equals(legacyTransaction.getStore().get_id())).findAny().orElse(null);
//            UUID employeeId = savedEmployee.get(0).getId();
//            UUID storeId = null;
//            Optional<Store> a = savesStores.stream().filter(savesStore -> EnumStoreRole.ADMIN.equals(savesStore.getRole())).findFirst();
//            if (a.isPresent()) {
//                storeId = a.get().getId();
//            }
//            if (lE != null) {
//                Employee e = savedEmployee.stream().filter(eee -> eee.getFirstName().equals(lE.getFirstName())).findAny().orElse(null);
//                if (e != null) {
//                    employeeId = e.getId();
//                }
//            }
//
//            if (lS != null) {
//                Store ssss = savesStores.stream().filter(sss -> sss.getSequence().equals(lS.getNumber())).findAny().orElse(null);
//                if (ssss != null) {
//                    storeId = ssss.getId();
//                }
//            }
//
//            Transaction newTransaction = Transaction
//                    .builder()
//                    .id(UUID.randomUUID())
//                    .color(legacyTransaction.getColor())
//                    .transactionNumber(legacyTransaction.getSequentialNumber())
//                    .contact(legacyTransaction.getNumber())
//                    .device(legacyTransaction.getDevice())
//                    .customerName(legacyTransaction.getName())
//                    .imei(legacyTransaction.getImei())
//                    .inspection("no".equals(legacyTransaction.getInspetion()) ? false : true)
//                    .pickupTime(legacyTransaction.getTime())
//                    .status("Waiting for parts".equals(legacyTransaction.getStatus()) ? EnumTransactionStatus.WAIT : "Send Away".equals(legacyTransaction.getStatus()) ? EnumTransactionStatus.SENT : EnumTransactionStatus.DONE)
//                    .issue(legacyTransaction.getIssue())
//                    .resolution(legacyTransaction.getResolution())
//                    .createdBy(Employee.builder().id(employeeId).build())
//                    .finalisedBy(Employee.builder().id(employeeId).build())
//                    .store(Store.builder().id(storeId).build())
//                    .products(legacyTransaction
//                            .getEstimate()
//                            .stream()
//                            .map(estimate -> {
//                                return TransactionProduct.builder()
//                                        .number(estimate.getItem())
//                                        .price(estimate.getPrice())
//                                        .description(estimate.getDescription())
//                                        .build();
//                            })
//                            .collect(Collectors.toList()))
//                    .build();
//
//            return newTransaction;
//
//        }).collect(Collectors.toList());
//
//        List<Transaction> hh = histories.getBody().getHistory().stream().map(legacyTransaction -> {
//
//            LegacyEmployee lE = employees.getBody().stream().filter(e -> e.get_id().equals(legacyTransaction.getCreatedBy().get_id())).findAny().orElse(null);
//            LegacyStore lS = stores.getBody().stream().filter(e -> e.get_id().equals(legacyTransaction.getStore().get_id())).findAny().orElse(null);
//
//            UUID employeeId = savedEmployee.get(0).getId();
//            UUID storeId = null;
//            Optional<Store> a = Optional.ofNullable(savesStores.stream().filter(savesStore -> savesStore.getRole() == EnumStoreRole.ADMIN).findFirst().orElse(null));
//            if (a.isPresent()) {
//                storeId = a.get().getId();
//            }
//            if (lE != null) {
//                Employee e = savedEmployee.stream().filter(eee -> eee.getBirthday().equals(lE.getBirth())).findAny().orElse(null);
//                if (e != null) {
//                    employeeId = e.getId();
//                }
//            }
//
//            if (lS != null) {
//                Store ssss = savesStores.stream().filter(sss -> sss.getSequence().equals(lS.getNumber())).findAny().orElse(null);
//                if (ssss != null) {
//                    storeId = ssss.getId();
//                }
//            }
//
//            Transaction newTransaction = Transaction
//                    .builder()
//                    .id(UUID.randomUUID())
//                    .color(legacyTransaction.getColor())
//                    .reference(legacyTransaction.getSequentialNumber())
//                    .contact(legacyTransaction.getNumber())
//                    .device(legacyTransaction.getDevice())
//                    .customerName(legacyTransaction.getName())
//                    .imei(legacyTransaction.getImei())
//                    .inspections(new ArrayList<>())
//                    .pickupTime(legacyTransaction.getTime())
//                    .status(EnumTransactionStatus.DONE)
//                    .issue(legacyTransaction.getIssue())
//                    .resolution(legacyTransaction.getResolution())
//                    .finalisedBy(Employee.builder().id(employeeId).build())
//                    .createdBy(Employee.builder().id(employeeId).build())
//                    .store(Store.builder().id(storeId).build())
//                    .finalisedTime(legacyTransaction.getFinalisedTime())
//                    .products(legacyTransaction
//                            .getEstimate()
//                            .stream()
//                            .map(estimate -> {
//                                return TransactionProduct.builder()
//                                        .number(estimate.getItem())
//                                        .price(estimate.getPrice())
//                                        .description(estimate.getDescription())
//                                        .build();
//                            })
//                            .collect(Collectors.toList()))
//                    .build();
//
//            return newTransaction;
//
//        }).collect(Collectors.toList());
//
//        transactionService.createTransactionBatch(tt);
//        transactionService.createTransactionBatch(hh);
//
//        return new ResponseEntity<>(stores.getBody(), HttpStatus.OK);
//    }
}

