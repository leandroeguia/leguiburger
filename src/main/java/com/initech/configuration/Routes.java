package com.initech.configuration;

import com.google.inject.Inject;
import com.initech.controller.impl.DefaultMenuController;
import com.initech.controller.impl.ExecutableController;
import io.javalin.Javalin;


public class Routes {

    @Inject
    @DefaultMenuController.MenuController
    ExecutableController defaultMenuController;

    public void register(Javalin app) {
        app.get("/ping", ctx -> ctx.result("Pong"));
        app.get("/menu", defaultMenuController::execute);
    }
}