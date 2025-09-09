package com.initech.core.dtos.responses.order;

import com.initech.core.dtos.domain.OrderDto;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class OrderResponse {
    public OrderDto order;
}
