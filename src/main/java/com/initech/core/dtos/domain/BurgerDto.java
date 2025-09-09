package com.initech.core.dtos.domain;

import java.math.BigDecimal;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;


@Getter
@Builder
@AllArgsConstructor
public class BurgerDto {

    private String name;
    private String description;
    private String ingredients;
    private BigDecimal price;
    private boolean available;

}
