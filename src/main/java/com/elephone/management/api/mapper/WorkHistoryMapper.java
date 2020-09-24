package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.WorkHistoryDTO;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.WorkHistory;
import org.springframework.stereotype.Component;

@Component
public class WorkHistoryMapper {

    public WorkHistoryDTO toDTO(WorkHistory workHistory) {
        if (workHistory == null) {
            return null;
        }

        WorkHistoryDTO workHistoryDTO = new WorkHistoryDTO();
        workHistoryDTO.setId(workHistory.getId());
        workHistoryDTO.setStart(workHistory.getStart());
        workHistoryDTO.setFinish(workHistory.getFinish());
        workHistoryDTO.setEmployeeId(workHistory.getEmployee().getId());

        return workHistoryDTO;
    }

    public WorkHistory fromDTO(WorkHistoryDTO workHistoryDTO) {
        if (workHistoryDTO == null) {
            return null;
        }

        WorkHistory workHistory = new WorkHistory();
        workHistory.setId(workHistoryDTO.getId());
        workHistory.setStart(workHistoryDTO.getStart());
        workHistory.setFinish(workHistoryDTO.getFinish());
        if (workHistoryDTO.getEmployeeId() != null) {
            workHistory.setEmployee(Employee.builder().id(workHistoryDTO.getId()).build());
        }

        return workHistory;
    }
}
