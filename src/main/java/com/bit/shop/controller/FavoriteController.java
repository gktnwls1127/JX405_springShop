package com.bit.shop.controller;

import com.bit.shop.model.FavoriteDTO;
import com.bit.shop.model.MemberCustomDetails;
import com.bit.shop.model.MemberDTO;
import com.bit.shop.model.ProductDTO;
import com.bit.shop.service.FavoriteService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/like/")
@RestController
public class FavoriteController {
    private FavoriteService favoriteService;

    public FavoriteController(FavoriteService favoriteService){
        this.favoriteService = favoriteService;
    }

    @PostMapping("insertLike")
    public String insertLike(@RequestParam Map<String, Object> params, HttpSession session){
        FavoriteDTO favoriteDTO = new FavoriteDTO();
        String result = "";

        int productId = Integer.parseInt((String) params.get("productId"));
        int memberId = ((MemberDTO) session.getAttribute("logIn")).getId();

        try {
            favoriteDTO.setProductId(productId);
            favoriteDTO.setMemberId(memberId);

            favoriteService.insert(favoriteDTO);

            result = "success";
        } catch (Exception e){
            result = "error";
        }
        return result;
    }

    @GetMapping("removeLike")
    public String removeLike(@RequestParam Map<String, Object> params, HttpSession session){
        String result = "";

        int id = Integer.parseInt((String) params.get("id"));

        try {
            favoriteService.delete(id);
            result = "success";
        } catch (Exception e){
            result = "error";
        }
        return result;
    }

    @GetMapping("showLike/{id}/{pageNo}")
    public ModelAndView showLike(RedirectAttributes redirectAttributes, Model model, @PathVariable int id, @PathVariable int pageNo){
        ModelAndView mav = new ModelAndView();
        List<FavoriteDTO> list = favoriteService.memberLike(id, pageNo);

        if (list == null) {
            redirectAttributes.addFlashAttribute("message", "좋아요한 상품이 존재하지 않습니다..");
            mav.setViewName("/");
        }

        mav.setViewName("/like/showLike");
        mav.addObject("likeList", list);
        mav.addObject("paging", setPages(pageNo, favoriteService.selectLastPage(id)));
        mav.addObject("current", pageNo);
        mav.addObject("pagingAddr", "/like/showLike/" + id);


        return mav;
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
