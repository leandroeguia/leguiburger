package com.initech.services.imlp;

import com.google.inject.Inject;
import com.initech.core.dtos.responses.customers.CustomerResponse;
import com.initech.repositories.daos.CustomersDao;
import com.initech.services.CustomerService;

import java.sql.SQLException;


public class DefaultCustomersService implements CustomerService {

    @Inject
    private CustomersDao defaultCustomersDao;


    @Override
    public CustomerResponse getAllCustomers(Model mla) {
        try {
            return CustomerResponse.builder()
                    .customers(defaultCustomersDao.findAll()).build();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
