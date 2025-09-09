package com.initech.core.dtos.domain;

import com.initech.core.enums.BurgerStatus;
import java.time.LocalDateTime;
import java.util.List;

import com.initech.core.enums.DeliveryStatus;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class OrderDto {

    private Long id;
    private LocalDateTime createdAt;
    private BurgerStatus status;
    private DeliveryStatus deliveryStatus;
    private CustomerDto customerDto;
    private Double totalPrice;
    private List<OderItemDto> orderItem;
}
