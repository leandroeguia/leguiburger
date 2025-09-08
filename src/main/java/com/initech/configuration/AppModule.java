package com.initech.configuration;

import com.google.inject.AbstractModule;
import com.google.inject.Singleton;
import com.initech.controller.impl.DefaultMenuController;
import com.initech.controller.impl.ExecutableController;
import com.initech.services.MenuService;
import com.initech.services.imlp.DefaultMenuService;
import com.initech.repositories.datasources.DataSourceProvider;

import javax.sql.DataSource;

public class AppModule extends AbstractModule {

    @Override
    protected void configure() {
        // Properties file binding
        bind(AppConfig.class).in(Singleton.class);

        // Datasource binding
        bind(DataSource.class).toProvider(new DataSourceProvider()).in(Singleton.class);

        // Handler injection
        bind(ExecutableController.class).annotatedWith(DefaultMenuController.MenuController.class).to(DefaultMenuController.class);

        // Interfaces binding
        bind(MenuService.class).to(DefaultMenuService.class);

    }
}