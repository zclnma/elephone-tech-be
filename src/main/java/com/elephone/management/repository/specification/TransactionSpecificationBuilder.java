package com.elephone.management.repository.specification;

import com.elephone.management.domain.Transaction;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.domain.Specification;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class TransactionSpecificationBuilder {

    private final List<SearchCriteria> params = new ArrayList<>();

    public TransactionSpecificationBuilder with(String key, String operation, Object value) {
        if (!StringUtils.isEmpty(operation) && !StringUtils.isEmpty(key) && value != null) {
            params.add(new SearchCriteria(key, operation, value));
        }

        return this;
    }

    public Specification<Transaction> build() {
        if (params.size() == 0) {
            return null;
        }
        List<Specification<Transaction>> specifications = params.stream()
                .map(TransactionSpecification::new)
                .collect(Collectors.toList());

        Specification result = specifications.get(0);

        for (int i = 1; i < params.size(); i++) {
            result = Specification.where(result).and(specifications.get(i));
        }
        return result;
    }
}
