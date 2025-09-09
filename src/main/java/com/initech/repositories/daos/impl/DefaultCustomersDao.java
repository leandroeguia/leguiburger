package com.initech.repositories.daos.impl;

import com.initech.repositories.daos.CustomersDao;
import com.initech.repositories.entities.Customer;

import javax.inject.Inject;
import javax.inject.Singleton;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Singleton
public class DefaultCustomersDao implements CustomersDao {

    private final static String SELECT_ALL_COSTUMERS = "SELECT * FROM customer";


    private final DataSource dataSource;

    @Inject
    public DefaultCustomersDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Customer> findAll() throws SQLException {
        List<Customer> customers = new ArrayList<>();

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_COSTUMERS);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                customers.add(mapRowToCustomer(rs));
            }
        }

        return customers;
    }

    private Customer mapRowToCustomer(ResultSet rs) throws SQLException {
        Customer c = new Customer();
        c.setId(rs.getLong("id"));
        c.setName(rs.getString("name"));
        c.setLastName(rs.getString("last_name"));
        c.setEmail(rs.getString("email"));
        c.setAddress(rs.getString("address"));
        c.setPhoneNumber(rs.getString("phone_number"));
        c.setDni(rs.getLong("dni"));
        c.setBirthDate(rs.getTimestamp("birth_date").toLocalDateTime());
        c.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        c.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
        return c;
    }
}
