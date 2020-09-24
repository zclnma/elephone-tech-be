package com.elephone.management.service;

import com.elephone.management.dispose.exception.WorkHistoryException;
import com.elephone.management.domain.Transaction;
import com.elephone.management.domain.WorkHistory;
import com.elephone.management.repository.WorkHistoryRepository;
import org.hibernate.jdbc.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class WorkHistoryService {

    private WorkHistoryRepository workHistoryRepository;

    @Autowired
    public WorkHistoryService(WorkHistoryRepository workHistoryRepository) {
        this.workHistoryRepository = workHistoryRepository;
    }

    public Page<WorkHistory> listWorkHistory(int page, int perPage) {
        return workHistoryRepository.findAllByOrderByCreatedDateDesc(PageRequest.of(page, perPage));
    }

    public Page<WorkHistory> listWorkHistoryByStoreId(UUID employeeId, int page, int perPage) {
        return workHistoryRepository.findByEmployee_IdOrderByCreatedDateDesc(employeeId, PageRequest.of(page, perPage));
    }

    public WorkHistory createWorkHistory(WorkHistory workHistory) {
        if (workHistory.getId() != null) {
            throw new WorkHistoryException("Do not provide a work history id.");
        }
        return workHistoryRepository.save(workHistory);
    }

    public WorkHistory updateWorkHistory(UUID employeeId) {
        WorkHistory workHistory = workHistoryRepository.findFirstByEmployee_IdAndFinishIsNull(employeeId);
        if(workHistory == null) {
            throw new WorkHistoryException("Can not update work history.");
        }
        //workHistory.setFinish(new Date());
       return workHistoryRepository.save(workHistory);
    }

    public List<WorkHistory> createWorkHistoryBatch(List<WorkHistory> workHistories) {
        return workHistoryRepository.saveAll(workHistories);
    }

}
