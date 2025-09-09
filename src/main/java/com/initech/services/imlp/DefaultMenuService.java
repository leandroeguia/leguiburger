package com.initech.services.imlp;

import com.initech.services.CustomerService;
import com.initech.services.MenuService;
import com.initech.core.dtos.domain.BurgerDto;
import com.initech.core.dtos.responses.menu.MenuResponse;
import java.math.BigDecimal;
import java.util.List;

public class DefaultMenuService implements MenuService {


    @Override
    public MenuResponse getAllBurgers(Model model) {
        return MenuResponse.builder()
                .burgerDtos(List.of(BurgerDto.builder().name("Cuarto de libra").price(new BigDecimal(1000)).build()))
                .build();
    }
}