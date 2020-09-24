package com.elephone.management.service;

import com.elephone.management.dispose.exception.IncomeException;
import com.elephone.management.domain.Income;
import com.elephone.management.repository.IncomeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class IncomeService {

    private IncomeRepository incomeRepository;

    @Autowired
    public IncomeService(IncomeRepository incomeRepository) {
        this.incomeRepository = incomeRepository;
    }

    public Page<Income> listIncomes(int page, int perPage) {
        return incomeRepository.findAllByOrderByCreatedDateDesc(PageRequest.of(page, perPage));
    }

    public Page<Income> listIncomesByStoreId(UUID storeId, int page, int perPage) {
        return incomeRepository.findByStore_IdOrderByCreatedDateDesc(storeId, PageRequest.of(page, perPage));
    }

    public Income createIncome(Income income) {
        if (income.getId() != null) {
            throw new IncomeException("Do not provide income id.");
        }
        return incomeRepository.save(income);
    }

    public List<Income> createIncomeBatch(List<Income> incomes) {
        return incomeRepository.saveAll(incomes);
    }

}
