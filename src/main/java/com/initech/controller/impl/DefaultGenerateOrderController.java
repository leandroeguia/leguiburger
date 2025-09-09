package com.initech.controller.impl;

import com.google.inject.BindingAnnotation;
import com.google.inject.Inject;
import com.initech.controller.AbstractController;
import com.initech.services.OrderService;
import io.javalin.http.Context;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

public class DefaultGenerateOrderController extends AbstractController {

    @BindingAnnotation
    @Target({ElementType.FIELD, ElementType.PARAMETER, ElementType.METHOD})
    @Retention(RetentionPolicy.RUNTIME)
    public @interface generateOrderController {
    }

    private final OrderService defaultOrderService;

    @Inject
    public DefaultGenerateOrderController(OrderService defaultOrderService) {
        this.defaultOrderService = defaultOrderService;
    }


    protected Object doExecute(Context ctx) {
        return defaultOrderService.apply(
                OrderService.Model.builder()
                        .callerId(12345L)
                        .isCbt(false)
                        .siteId("MLA")
                        .build()
        );

    }
}