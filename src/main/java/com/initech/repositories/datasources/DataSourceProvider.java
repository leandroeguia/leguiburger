package com.initech.repositories.datasources;

import com.google.inject.Provider;
import com.initech.configuration.AppConfig;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import javax.sql.DataSource;

public class DataSourceProvider implements Provider<DataSource> {

    private static final String JDBC_USER = "db.username";
    private static final String JDBC_PASSWORD = "db.password";
    private static final String JDBC_URL = "db.url";

    private final HikariDataSource dataSource;

    public DataSourceProvider() {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl(AppConfig.get(JDBC_URL));
        config.setUsername(AppConfig.get(JDBC_USER));
        config.setPassword(AppConfig.get(JDBC_PASSWORD));
        this.dataSource = new HikariDataSource(config);
    }

    @Override
    public DataSource get() {
        return this.dataSource;
    }
}

