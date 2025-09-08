package com.initech.core.dtos.domain;

import com.initech.core.enums.BurgerStatus;
import java.time.LocalDateTime;
import java.util.List;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class OrderDto {

    private Long id;
    private LocalDateTime createdAt;
    private BurgerStatus status;
    private CustomerDto customerDto;
    private List<OderItemDto> orderItem;
}
