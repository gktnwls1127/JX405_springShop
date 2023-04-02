package com.bit.shop.controller;

import com.bit.shop.model.BuyingDTO;
import com.bit.shop.model.MemberDTO;
import com.bit.shop.service.BuyingService;
import com.bit.shop.service.CartService;
import com.mysql.cj.xdevapi.JsonArray;
import com.mysql.cj.xdevapi.JsonParser;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/order/")
public class BuyingController {
    private BuyingService buyingService;
    private CartService cartService;

    @Autowired
    public BuyingController(BuyingService buyingService, CartService cartService) {
        this.buyingService = buyingService;
        this.cartService = cartService;
    }

    @GetMapping("orderList/{id}/{pageNo}")
    public ModelAndView showOrder(HttpSession session, RedirectAttributes redirectAttributes, Model model, @PathVariable int id, @PathVariable int pageNo) {

        List<BuyingDTO> order = buyingService.memberOrder(id, pageNo);
        ModelAndView mav = new ModelAndView();
        if (order == null) {
            redirectAttributes.addFlashAttribute("message", "주문한 상품이 존재하지 않습니다.");
            mav.setViewName("/");
        }

        mav.addObject("orderList", order);
        mav.addObject("paging", setPages(pageNo, buyingService.selectLastPage(id)));
        mav.addObject("current", pageNo);
        mav.addObject("logIn", ((MemberDTO) session.getAttribute("logIn")));
        mav.addObject("pagingAddr", "/order/orderList/" + id);

        mav.setViewName("order/orderList");

        return mav;
    }

    @GetMapping("sellerOrder/{id}/{pageNo}")
    public ModelAndView showSellerOrder(HttpSession session, RedirectAttributes redirectAttributes, Model model, @PathVariable int id, @PathVariable int pageNo) {

        List<BuyingDTO> order = buyingService.orderSeller(id, pageNo);
        ModelAndView mav = new ModelAndView();
        if (order == null) {
            redirectAttributes.addFlashAttribute("message", "주문한 상품이 존재하지 않습니다.");
            mav.setViewName("/");
        }

        mav.addObject("orderList", order);
        mav.addObject("paging", setPages(pageNo, buyingService.selectSellerLastPage(id)));
        mav.addObject("current", pageNo);
        mav.addObject("logIn", ((MemberDTO) session.getAttribute("logIn")));
        mav.addObject("pagingAddr", "/order/sellerOrder/" + id);
        mav.setViewName("order/sellerOrder");

        return mav;
    }

    @PostMapping(value = "updateProcessing")
    public String updateProcess(@RequestParam Map<String, Object> params) {
        String result = "";

        int id = Integer.parseInt((String) params.get("id"));
        String processing = ((String) params.get("processing"));

        BuyingDTO b = buyingService.selectOne(id);
        try {
            b.setProcessing(processing);
            buyingService.updateProcess(b);

            result = "success";
        } catch (Exception e) {
            result = "error";
        }


        return result;
    }

    @PostMapping(value = "finish")
    public String finishProcess(@RequestParam Map<String, Object> params) {
        String result = "";

        int id = Integer.parseInt((String) params.get("id"));
        String processing = ((String) params.get("processing"));

        BuyingDTO b = buyingService.selectOne(id);
        try {
            b.setProcessing(processing);
            buyingService.updateProcess(b);

            result = "success";
        } catch (Exception e) {
            result = "error";
        }


        return result;
    }

    @PostMapping(value = "buy")
    public String buy(@RequestParam(value = "cart") String param) {
        String result = "";
        BuyingDTO buyingDTO = new BuyingDTO();
        try {
            List<Map<String,Object>> info = JSONArray.fromObject(param);

            for (Map<String, Object> memberInfo : info) {
                buyingDTO.setMemberId(Integer.parseInt((String) memberInfo.get("memberId")));
                int cartId = Integer.parseInt((String) memberInfo.get("cartId"));
                buyingDTO.setCartId(cartId);
                buyingDTO.setProductId(Integer.parseInt((String) memberInfo.get("productId")));
                buyingDTO.setTotalPrice(Integer.parseInt((String) memberInfo.get("totalPrice")));

                buyingService.insert(buyingDTO);
                cartService.ordered(cartId);
            }
            result = "success";
        } catch (Exception e) {
            result = "error";
        }

        return result;
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
