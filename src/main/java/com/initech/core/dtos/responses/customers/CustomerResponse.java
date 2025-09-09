package com.initech.core.dtos.responses.customers;

import com.initech.repositories.entities.Customer;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
public class CustomerResponse {

    private List<Customer> customers;
}
