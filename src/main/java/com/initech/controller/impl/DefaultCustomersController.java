package com.initech.controller.impl;

import com.google.inject.Inject;
import com.initech.services.CustomerService;
import io.javalin.http.Context;


public class DefaultCustomersController {

    private final CustomerService defaultCustomersService;

    @Inject
    public DefaultCustomersController(CustomerService defaultMenuService) {
        this.defaultCustomersService = defaultMenuService;
    }


    public void getAllCustomers(Context ctx) {
        ctx.json(defaultCustomersService.getAllCustomers(
                CustomerService.Model.builder()
                        .callerId(12345L)
                        .isCbt(false)
                        .siteId("MLA")
                        .build())
        );

    }
}
