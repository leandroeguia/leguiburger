package com.initech.configuration;

import com.google.inject.AbstractModule;
import com.google.inject.Singleton;
import com.initech.controller.impl.DefaultCustomersController;
import com.initech.controller.impl.DefaultGenerateOrderController;
import com.initech.controller.impl.DefaultMenuController;
import com.initech.controller.ExecutableController;
import com.initech.repositories.daos.CustomersDao;
import com.initech.repositories.daos.impl.DefaultCustomersDao;
import com.initech.services.CustomerService;
import com.initech.services.MenuService;
import com.initech.services.OrderService;
import com.initech.services.imlp.DefaultCustomersService;
import com.initech.services.imlp.DefaultMenuService;
import com.initech.repositories.datasources.DataSourceProvider;
import com.initech.services.imlp.DefaultOrderService;

import javax.sql.DataSource;

public class AppModule extends AbstractModule {

    @Override
    protected void configure() {
        // Properties file binding
        bind(AppConfig.class).in(Singleton.class);

        // Datasource binding
        bind(DataSource.class).toProvider(new DataSourceProvider()).in(Singleton.class);

        // Handler injection
        bind(ExecutableController.class).annotatedWith(DefaultGenerateOrderController.generateOrderController.class).to(DefaultGenerateOrderController.class);

        // Interfaces binding
        bind(MenuService.class).to(DefaultMenuService.class);
        bind(CustomerService.class).to(DefaultCustomersService.class);
        bind(OrderService.class).to(DefaultOrderService.class);

        // Daos Binding
        bind(CustomersDao.class).to(DefaultCustomersDao.class);

    }
}