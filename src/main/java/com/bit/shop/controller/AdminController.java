package com.bit.shop.controller;

import com.bit.shop.service.MemberService;
import com.bit.shop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {
    private ProductService productService;
    private MemberService memberService;

    public AdminController(ProductService productService, MemberService memberService){
        this.productService = productService;
        this.memberService = memberService;
    }

    @GetMapping("adminPage")
    public String showAdmin(){
        return "/admin/adminPage";
    }
}
