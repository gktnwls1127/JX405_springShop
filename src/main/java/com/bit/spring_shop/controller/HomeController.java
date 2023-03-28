package com.bit.spring_shop.controller;

import com.bit.spring_shop.service.CategoryService;
import com.bit.spring_shop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    private ProductService productService;

    public HomeController(ProductService productService){
        this.productService = productService;
    }
    @RequestMapping("/")
    public String showIndex(HttpSession session, Model model){
        model.addAttribute("list", productService.selectNew());
        model.addAttribute("bestList", productService.selectBest());
        model.addAttribute("logIn", session.getAttribute("logIn"));
        return  "index";
    }
}
