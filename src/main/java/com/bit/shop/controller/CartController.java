package com.bit.shop.controller;

import com.bit.shop.model.CartDTO;
import com.bit.shop.model.MemberDTO;
import com.bit.shop.service.CartService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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
    public String showCart(HttpSession session, Model model, @PathVariable int id) {

        model.addAttribute("cartList", cartService.cartALL(id));
        model.addAttribute("logIn", (MemberDTO) session.getAttribute("logIn"));
        model.addAttribute("countOrdered", cartService.orderedCount(id));

        return "/cart/showCart";
    }

    @GetMapping("payPage/{id}")
    public String pay(HttpSession session, Model model, @PathVariable int id) {

        model.addAttribute("cartList", cartService.cartALL(id));
        model.addAttribute("logIn", (MemberDTO) session.getAttribute("logIn"));

        return "/cart/payPage";
    }



}
