package com.initech.core.dtos.domain;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class OderItemDto {

    private Long id;
    private BurgerDto burgerDto;
    private Integer quantity;
}
