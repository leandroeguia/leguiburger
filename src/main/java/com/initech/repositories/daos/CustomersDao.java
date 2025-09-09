package com.initech.repositories.daos;

import com.initech.core.dtos.responses.customers.CustomerResponse;
import com.initech.repositories.entities.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomersDao {

    List<Customer> findAll() throws SQLException;
}
