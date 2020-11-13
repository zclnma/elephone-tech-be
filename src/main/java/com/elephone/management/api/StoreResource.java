package com.elephone.management.api;

import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.api.mapper.StoreMapper;
import com.elephone.management.data.*;
import com.elephone.management.domain.*;
import com.elephone.management.service.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.data.domain.Page;
import org.springframework.http.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/store")
@Api(tags = "Store Management")
public class StoreResource {

    private final TransactionService transactionService;
    private final IncomeService incomeService;
    private final EmployeeService employeeService;
    private final StoreService storeService;
    private final StoreMapper storeMapper;

    @Autowired
    public StoreResource(TransactionService transactionService, IncomeService incomeService, EmployeeService employeeService, StoreService storeService, StoreMapper storeMapper) {
        this.transactionService = transactionService;
        this.incomeService = incomeService;
        this.employeeService = employeeService;
        this.storeService = storeService;
        this.storeMapper = storeMapper;
    }

    @GetMapping
    @ApiOperation(value = "List stores", notes = "List a number of tickets.")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<List<StoreDTO>> list(
            @ApiParam(name = "page", defaultValue = "0") @RequestParam(required = false, defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam(required = false, defaultValue = "10") int perPage
    ) {
        Page<Store> stores = storeService.listStores(page, perPage);
        List<StoreDTO> dtoStores = stores.stream().map(storeMapper::toDTO).collect(Collectors.toList());
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Count", Long.toString(stores.getTotalElements()));
        return new ResponseEntity<>(dtoStores, headers, HttpStatus.OK);
    }

    @PostMapping
    @ApiOperation(value = "Create store", notes = "Create a store")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<StoreDTO> create(@Valid @RequestBody StoreDTO storeDTO) {
        Store store = storeService.createStore(storeMapper.fromDTO(storeDTO));
        return new ResponseEntity<>(storeMapper.toDTO(store), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    @ApiOperation(value = "Modify store", notes = "Modify store by store id")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<StoreDTO> updateById(@Valid @RequestBody StoreDTO storeDTO) {
        Store store = storeService.updateStore(storeMapper.fromDTO(storeDTO));
        return new ResponseEntity<>(storeMapper.toDTO(store), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "Delete store by store id", notes = "Modify store by store id")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<?> deleteById(@PathVariable UUID id) {
        storeService.deleteStoreById(id);
        return new ResponseEntity<>(new HashMap<String, String>() {{
            put("message", "Store: " + id + " has been deleted");
        }}, HttpStatus.ACCEPTED);
    }

//    @GetMapping(value = "/migration/{token}")
//    @ApiOperation(value = "Delete store by store id", notes = "Modify store by store id")
//    @PreAuthorize("hasAuthority('ADMIN')")
//    public ResponseEntity<List<LegacyStore>> a(@PathVariable String token) {
//
//        String history = "https://elephone.tech/api/history/?page=0&perPage=10";
//        String job = "https://elephone.tech/api/job";
//        String store = "https://elephone.tech/api/store";
//        String staff = "https://elephone.tech/api/staff";
//        String income = "https://elephone.tech/api/history/?page=0&perPage=100000";
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
//
//            Store newStore = Store.builder()
//                    .role("malvern".equals(legacyStore.getName()) ? EnumStoreRole.ADMIN : EnumStoreRole.STORE)
//                    .abn(legacyStore.getAbn())
//                    .name(legacyStore.getName())
//                    .sequence(legacyStore.getNumber())
//                    .warranty(legacyStore.getWarrenty() == null ? 90 : Integer.parseInt(legacyStore.getWarrenty()))
//                    .employees(new HashSet<>())
//                    .storeLocation(
//                            StoreLocation.builder()
//                                    .latStart((float) -999)
//                                    .latEnd((float) 999)
//                                    .lngStart((float) -999)
//                                    .lngEnd((float) 999)
//                                    .build()
//                    ).build();
//
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
//                .stores(new HashSet<>())
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


//        storeService.createStoreBatch(sssss);
//        employeeService.createEmployeeBatch(eeeee);


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
//                    .isFinalised(false)
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
//                    .transactionNumber(legacyTransaction.getSequentialNumber())
//                    .contact(legacyTransaction.getNumber())
//                    .device(legacyTransaction.getDevice())
//                    .customerName(legacyTransaction.getName())
//                    .imei(legacyTransaction.getImei())
//                    .inspection("no".equals(legacyTransaction.getInspetion()) ? false : true)
//                    .pickupTime(legacyTransaction.getTime())
//                    .status(EnumTransactionStatus.DONE)
//                    .issue(legacyTransaction.getIssue())
//                    .resolution(legacyTransaction.getResolution())
//                    .finalisedBy(Employee.builder().id(employeeId).build())
//                    .createdBy(Employee.builder().id(employeeId).build())
//                    .store(Store.builder().id(storeId).build())
//                    .finalisedTime(legacyTransaction.getFinalisedTime())
//                    .isFinalised(true)
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
//        List<Income> newIncomes = new ArrayList<>();
//
//        stores.getBody().forEach(s -> {
//            ResponseEntity<ApiLegacyIncome> i = restTemplate.exchange("https://elephone.tech/api/store/" + s.get_id() + "/income?page=0&perPage=10000", HttpMethod.GET, entity, ApiLegacyIncome.class);
//            ApiLegacyIncome apilegacyIncome = i.getBody();
//            apilegacyIncome.getIncome().stream().forEach(legacyIncome -> {
//
//                LegacyEmployee lE = employees.getBody().stream().filter(e -> e.get_id().equals(legacyIncome.getRecordedBy())).findAny().orElse(null);
//                LegacyStore lS = stores.getBody().stream().filter(e -> e.get_id().equals(s.get_id())).findAny().orElse(null);
//                UUID employeeId = savedEmployee.get(0).getId();
//                ;
//                UUID storeId = UUID.randomUUID();
//                if (lE != null) {
//                    Employee e = savedEmployee.stream().filter(eee -> eee.getFirstName().equals(lE.getFirstName())).findAny().orElse(null);
//                    if (e != null) {
//                        employeeId = e.getId();
//                    }
//                }
//
//                if (lS != null) {
//                    Store ssss = savesStores.stream().filter(sss -> sss.getSequence().equals(lS.getNumber())).findAny().orElse(null);
//                    if (ssss != null) {
//                        storeId = ssss.getId();
//                    }
//                }
//
//                Income newIncome = Income
//                        .builder()
//                        .id(UUID.randomUUID())
//                        .cash(legacyIncome.getCash())
//                        .efpos(legacyIncome.getEfpos())
//                        .employee(Employee.builder().id(employeeId).build())
//                        .store(Store.builder().id(storeId).build())
//                        .build();
//
//                newIncomes.add(newIncome);
//
//            });
//        });
//
//
//        transactionService.createTransactionBatch(tt);
//        transactionService.createTransactionBatch(hh);
//        incomeService.createIncomeBatch(newIncomes);
//
//        return new ResponseEntity<>(stores.getBody(), HttpStatus.OK);
//    }
}

