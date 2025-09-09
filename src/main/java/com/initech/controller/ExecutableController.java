package com.initech.controller;

import io.javalin.http.Context;

@FunctionalInterface
public interface ExecutableController {
    void execute(Context context);
}
