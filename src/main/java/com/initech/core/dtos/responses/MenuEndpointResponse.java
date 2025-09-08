package com.initech.core.dtos.responses;

import com.initech.core.dtos.domain.BurgerDto;
import java.util.List;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MenuEndpointResponse {

    private List<BurgerDto> burgerDtos;
}
