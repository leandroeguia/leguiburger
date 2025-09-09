package com.initech.core.dtos.responses.menu;

import com.initech.core.dtos.domain.BurgerDto;
import java.util.List;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MenuResponse {

    private List<BurgerDto> burgerDtos;
}
