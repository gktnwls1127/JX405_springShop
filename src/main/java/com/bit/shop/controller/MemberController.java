package com.bit.shop.controller;

import com.bit.shop.model.MemberDTO;
import com.bit.shop.service.MemberService;
import com.bit.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/")
public class MemberController {
    private MemberService memberService;
    private ProductService productService;
    @Autowired
    public MemberController(MemberService memberService, ProductService productService){
        this.memberService = memberService;
        this.productService = productService;
    }
    @GetMapping("login")
    public String showLogIn(){
        return "member/login";
    }

    @PostMapping("auth")
    public String auth(HttpSession session, Model model, MemberDTO attempt){
        MemberDTO result = memberService.auth(attempt);

        if (result != null){
            model.addAttribute("logIn", result);
            return "redirect:/";
        }
        else {
            model.addAttribute("message", "로그인 정보를 다시 확인해주세요.");
            return "/member/login";
        }
    }

    @GetMapping("register")
    public String showRegister(){
        return "member/register";
    }

    @PostMapping("register")
    public String register(Model model, MemberDTO attempt){

        if (memberService.register(attempt)) {
            return "redirect:/";
        }
        else {
            model.addAttribute("message", "중복된 아이디로 가입하실 수 없습니다.");
            return "member/register";
        }
    }
    @GetMapping("myPage/{id}")
    public String showMyPage(RedirectAttributes redirectAttributes, Model model, @PathVariable int id){
        MemberDTO m = memberService.selectOne(id);
        if (m == null){
            redirectAttributes.addFlashAttribute("message", "존재하지 않는 회원입니다.");
            return "redirect:/";
        }

        model.addAttribute("result", m);

        return "/member/myPage";
    }

    @GetMapping("update/{id}")
    public String showUpdate(@PathVariable int id){
        return "member/update";
    }

    @GetMapping("cart/{id}")
    public String showCart(@PathVariable int id){
        return "showCart";
    }




}
