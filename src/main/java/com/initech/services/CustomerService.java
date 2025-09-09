package com.initech.services;

import com.initech.core.dtos.responses.customers.CustomerResponse;
import lombok.Builder;
import lombok.Getter;



public interface CustomerService {

    @Getter
    @Builder
    class Model {
        private Long callerId;
        private String siteId;
        private boolean isCbt;
        private String currentPeriod;
    }

    CustomerResponse getAllCustomers(Model model);

}
