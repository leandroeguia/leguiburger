package com.initech.controller.impl;

import io.javalin.http.Context;

@FunctionalInterface
public interface ExecutableController {
    void execute(Context context);
}
