package com.initech;

import com.google.inject.Guice;
import com.google.inject.Injector;
import com.initech.configuration.AppConfig;
import com.initech.configuration.AppModule;
import com.initech.configuration.Routes;
import io.javalin.Javalin;


public class Main {

    private static final String SERVER_PORT = "server.port";

    public static void main(String[] args) {

        Injector injector = Guice.createInjector(new AppModule());
        Routes routes = injector.getInstance(Routes.class);

        int port = Integer.parseInt(AppConfig.get(SERVER_PORT));
        Javalin app = Javalin.create().start(port);
        routes.register(app);

        System.out.println("App started successfully");
    }
}