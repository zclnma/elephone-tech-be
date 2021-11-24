package com.elephone.management.service;

import com.elephone.management.domain.RepairType;
import com.elephone.management.repository.RepairTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RepairTypeService {
    private final RepairTypeRepository repairTypeRepository;

    @Autowired
    public RepairTypeService(RepairTypeRepository repairTypeRepository) {
        this.repairTypeRepository = repairTypeRepository;
    }

    public List<RepairType> list() {
        List<RepairType> repairTypeList = repairTypeRepository.findAll();
        List<RepairType> repairTypes = new ArrayList<>();
        for (RepairType repairType : repairTypeList){
            if (repairType.getIsActive()){
                repairTypes.add(repairType);
            }
        }
        return repairTypes;
    }
}
