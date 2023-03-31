package com.bit.shop.controller;

import com.bit.shop.model.CartDTO;
import com.bit.shop.service.CartService;
import com.mysql.cj.xdevapi.JsonArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/cart/")
@RestController
public class CartRestController {
    private CartService cartService;

    @Autowired
    public CartRestController(CartService cartService) {
        this.cartService = cartService;
    }

    @PostMapping(value = "addCart")
    public String addCart(@RequestParam Map<String, Object> params, Authentication authentication) {
        String result = "";
        CartDTO cartDTO = new CartDTO();

        int productId = Integer.parseInt((String) params.get("productId"));
        int memberId = Integer.parseInt((String) params.get("memberId"));
        int productCount = Integer.parseInt((String) params.get("productCount"));


        try {
            if (cartService.findCart(productId, memberId) != null) {
                CartDTO attempt = cartService.findCart(productId, memberId);

                int count = attempt.getProductCount() + productCount;
                attempt.setProductCount(count);

                cartService.update(attempt);


            } else {
                cartDTO.setProductId(productId);
                cartDTO.setMemberId(memberId);
                cartDTO.setProductCount(productCount);

                cartService.insert(cartDTO);
            }

            result = "success";

        } catch (Exception e) {
            result = "error";
        }

        return result;
    }

    @PostMapping(value = "updateCount")
    public String updateCount(@RequestParam Map<String, Object> params) {
        String result = "";

        int id = Integer.parseInt((String) params.get("id"));
        int productCount = Integer.parseInt((String) params.get("productCount"));


        try {
            CartDTO attempt = cartService.selectOne(id);
            attempt.setProductCount(productCount);

            cartService.update(attempt);

            result = "success";

        } catch (Exception e) {
            result = "error";
        }

        return result;

    }

    @GetMapping(value = "deleteSelect")
    public String deleteSelect(@RequestParam(value = "cartId") List<String> params) {
        String result = "";

        try {
            for (int i =0; i<params.size(); i++){
                cartService.delete(Integer.parseInt(params.get(i)));
            }
            result = "success";

        } catch (Exception e) {
            result = "error";

        }
        return result;
    }

    @GetMapping(value = "deleteAll")
    public String deleteAll(@RequestParam Map<String, Object> params) {
        String result = "";
        int memberId = Integer.parseInt((String) params.get("memberId"));

        try {
            cartService.memberCartDel(memberId);
            result = "success";

        } catch (Exception e) {
            result = "error";

        }
        return result;
    }

}
