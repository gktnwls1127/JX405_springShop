package com.bit.shop.controller;

import com.bit.shop.service.BuyingService;
import com.bit.shop.service.MemberService;
import com.bit.shop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;

@Controller
@RequestMapping("/admin/")
public class AdminController {
    private ProductService productService;
    private MemberService memberService;

    private BuyingService buyingService;

    public AdminController(ProductService productService, MemberService memberService, BuyingService buyingService){
        this.productService = productService;
        this.memberService = memberService;
        this.buyingService = buyingService;
    }

    @GetMapping("dashBoard")
    public String showAdmin(Model model){
        model.addAttribute("memberCount", memberService.selectLastPageAll());
        model.addAttribute("orderCount", buyingService.selectLastPageAll());
        model.addAttribute("productCount", productService.selectLastPageAll());
        return "/admin/adminPage";
    }

    @GetMapping("member/{pageNo}")
    public String showMember(Model model, @PathVariable int pageNo){
        model.addAttribute("memberList", memberService.selectAll(pageNo));
        model.addAttribute("paging", setPages(pageNo, memberService.selectLastPageAll()));
        model.addAttribute("current", pageNo);
        model.addAttribute("pagingAddr", "/admin/member/");
        return "/admin/member";
    }

    @GetMapping("order/{pageNo}")
    public String showOrder(Model model, @PathVariable int pageNo){
        model.addAttribute("orderList", buyingService.selectAll(pageNo));
        model.addAttribute("paging", setPages(pageNo, buyingService.selectLastPageAll()));
        model.addAttribute("current", pageNo);
        model.addAttribute("pagingAddr", "/admin/order/");
        return "/admin/order";
    }

    @GetMapping("product/{pageNo}")
    public String showProduct(Model model, @PathVariable int pageNo){
        model.addAttribute("productList", productService.selectAll(pageNo));
        model.addAttribute("paging", setPages(pageNo, productService.selectLastPageAll()));
        model.addAttribute("current", pageNo);
        model.addAttribute("pagingAddr", "/admin/product/");
        return "/admin/product";
    }

    private HashMap<String, Integer> setPages(int pageNo, int totalPage) {
        HashMap<String, Integer> paging = new HashMap<>();

        int start = 0;
        int end = 0;

        if (totalPage < 5) {
            start = 1;
            end = totalPage;
        } else if (pageNo < 3) {
            start = 1;
            end = 5;
        } else if (pageNo > totalPage - 3) {
            start = totalPage - 4;
            end = totalPage;
        } else {
            start = pageNo - 2;
            end = pageNo + 2;
        }

        paging.put("start", start);
        paging.put("end", end);
        paging.put("totalPage", totalPage);
        paging.put("current", pageNo);

        return paging;
    }


}
