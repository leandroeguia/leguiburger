package com.initech.controller;

import io.javalin.http.Context;
import org.jetbrains.annotations.NotNull;

public abstract class AbstractController implements ExecutableController {


    @Override
    public void execute(@NotNull Context ctx){
        Object response = doExecute(ctx);
        signResponse(ctx, response);
    }

    protected abstract Object doExecute(Context ctx);

    protected void signResponse(Context ctx, Object response) {
        ctx.status(200).json(response);
    }
}