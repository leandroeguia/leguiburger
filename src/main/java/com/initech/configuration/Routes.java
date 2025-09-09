package com.initech.configuration;

import com.google.inject.Inject;
import com.initech.controller.impl.DefaultCustomersController;
import com.initech.controller.impl.DefaultMenuController;
import com.initech.controller.ExecutableController;
import io.javalin.Javalin;


public class Routes {

    @Inject
    DefaultMenuController defaultMenuController;

    @Inject
    DefaultCustomersController defaultCustomersController;

    public void register(Javalin app) {
        app.get("/ping", ctx -> ctx.result("Pong"));
        app.get("/menu/all", defaultMenuController::getAllBurgers);
        app.get("/customers/all", defaultCustomersController::getAllCustomers);
    }
}