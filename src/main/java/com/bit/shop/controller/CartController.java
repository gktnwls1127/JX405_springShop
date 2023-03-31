package com.bit.shop.controller;

import com.bit.shop.model.CartDTO;
import com.bit.shop.service.CartService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/cart/")
public class CartController {
    private CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @GetMapping("showCart/{id}")
    public String showCart(Model model, @PathVariable int id) {
        int totalPrice = cartService.totalPrice(id);
        int deliveryPrice = 3000;

        if (totalPrice >= 50000) {
            deliveryPrice = 0;
        }

        model.addAttribute("cartList", cartService.cartALL(id));
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("deliveryPrice", deliveryPrice);

        return "/cart/showCart";
    }



}
