package com.initech.services;

import com.initech.core.dtos.responses.order.OrderResponse;
import lombok.Builder;
import lombok.Getter;

import java.util.function.Function;

public interface OrderService extends Function<OrderService.Model, OrderResponse> {

    @Getter
    @Builder
    class Model {
        private Long callerId;
        private String siteId;
        private boolean isCbt;
        private String currentPeriod;
    }
}
