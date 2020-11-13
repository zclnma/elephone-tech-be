package com.elephone.management.repository.specification;

import com.elephone.management.domain.Store;
import com.elephone.management.domain.Transaction;
import lombok.AllArgsConstructor;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.*;
import java.util.UUID;

@AllArgsConstructor
public class TransactionSpecification implements Specification<Transaction> {

    private static final long serialVersionUID = 42L;

    private SearchCriteria searchCriteria;

    @Override
    public Predicate toPredicate(Root<Transaction> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
        if (searchCriteria.getOperation().equalsIgnoreCase(">")) {
            return builder.greaterThanOrEqualTo(root.get(searchCriteria.getKey()), searchCriteria.getValue().toString());
        } else if (searchCriteria.getOperation().equalsIgnoreCase("<")) {
            return builder.lessThanOrEqualTo(root.get(searchCriteria.getKey()), searchCriteria.getValue().toString());
        } else if (searchCriteria.getOperation().equalsIgnoreCase(":")) {
            if (searchCriteria.getValue() instanceof Boolean) {
                return builder.equal(root.get(searchCriteria.getKey()), searchCriteria.getValue());
            } else if (searchCriteria.getValue() instanceof UUID) {
                return builder.equal(root.get(searchCriteria.getKey()), searchCriteria.getValue());
            } else {
                return builder.like(root.get(searchCriteria.getKey()), "%" + searchCriteria.getValue() + "%");
            }
        }
        return null;
    }

}
