package com.initech.core.dtos.domain;

import java.math.BigDecimal;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class IngredientDto {

    private Long id;
    private String name;
    private BigDecimal price;
    private boolean vegetarian;
}
