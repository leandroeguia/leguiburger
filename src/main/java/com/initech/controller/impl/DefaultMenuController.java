package com.initech.controller.impl;

import com.google.inject.BindingAnnotation;
import com.google.inject.Inject;
import com.initech.controller.AbstractController;
import com.initech.services.imlp.DefaultMenuService;
import com.initech.services.MenuService;
import io.javalin.http.Context;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


public class DefaultMenuController extends AbstractController {

    @BindingAnnotation
    @Target({ElementType.FIELD, ElementType.PARAMETER, ElementType.METHOD})
    @Retention(RetentionPolicy.RUNTIME)
    public @interface MenuController {
    }

    private final DefaultMenuService defaultMenuService;

    @Inject
    public DefaultMenuController(DefaultMenuService defaultMenuService) {
        this.defaultMenuService = defaultMenuService;
    }


    protected Object doExecute(Context ctx) {
        return defaultMenuService.apply(
                MenuService.Model.builder()
                        .callerId(12345L)
                        .isCbt(false)
                        .siteId("MLA")
                        .build()
        );

    }
}
