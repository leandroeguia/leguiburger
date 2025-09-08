package com.initech.services;

import com.initech.core.dtos.responses.MenuEndpointResponse;
import lombok.Builder;
import lombok.Getter;

import java.util.function.Function;

public interface MenuService extends Function<MenuService.Model, MenuEndpointResponse> {

    @Getter
    @Builder
    class Model {
        private Long callerId;
        private String siteId;
        private boolean isCbt;
        private String currentPeriod;
    }
}
