package com.bit.shop.controller;

import com.bit.shop.model.MemberDTO;
import com.bit.shop.model.ProductDTO;
import com.bit.shop.service.CategoryService;
import com.bit.shop.service.FavoriteService;
import com.bit.shop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/product/")
public class ProductController {
    private ProductService productService;
    private CategoryService categoryService;
    private FavoriteService favoriteService;

    public ProductController(ProductService productService, CategoryService categoryService, FavoriteService favoriteService) {
        this.productService = productService;
        this.categoryService = categoryService;
        this.favoriteService = favoriteService;
    }

    @GetMapping("upsert")
    public String showUpsert(Model model) {
        model.addAttribute("categoryList", categoryService.selectAll());
        return "/product/upsert";
    }

    @PostMapping("upsert")
    public String upsert(HttpSession session, @RequestParam("file") MultipartFile file, HttpServletRequest request, String attemptId, ProductDTO productDTO) {
        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

        if (!logIn.getRole().equals("ROLE_SELLER")) {
            return "redirect:/";
        }

        String uploadFolder = "/resources/upload/";
        String fileRealName = file.getOriginalFilename();

        UUID uuid = UUID.randomUUID();
        String filename = uuid + "_" + fileRealName;

        File saveFile = new File(request.getServletContext().getRealPath(uploadFolder) + filename);
        try {
            file.transferTo(saveFile);
            if (attemptId.matches("^\\d+$")) {
                productDTO.setId(Integer.parseInt(attemptId));
                ProductDTO origin = productService.selectOne(productDTO.getId());
                origin.setName(productDTO.getName());
                origin.setDescription(productDTO.getDescription());
                origin.setImage("upload/" + filename);
                origin.setCategoryId(productDTO.getCategoryId());
                origin.setPrice(productDTO.getPrice());
                productService.update(origin);
            } else {
                productDTO.setSellerId(logIn.getId());
                productDTO.setImage("upload/" + filename);
                productService.insert(productDTO);
            }
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/product/showOne/" + productDTO.getId();
    }

    @GetMapping("category/{categoryId}")
    public String showCategory(Model model, @PathVariable int categoryId) {
        model.addAttribute("list", productService.categoryAll(categoryId));
        return "/product/category";
    }

    @GetMapping("update/{id}")
    public String showUpdate(HttpSession session, RedirectAttributes redirectAttributes, Model model, @PathVariable int id) {
        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");
        if (!logIn.getRole().equals("ROLE_SELLER")) {
            redirectAttributes.addFlashAttribute("message", "접근이 불가한 페이지입니다.");
            return "redirect:/";
        }

        ProductDTO productDTO = productService.selectOne(id);
        if (productDTO == null || productDTO.getSellerId() != logIn.getId()) {
            redirectAttributes.addFlashAttribute("message", "유효하지 않은 접근입니다.");
            return "redirect:/";
        }

        model.addAttribute("product", productDTO);

        return "/product/upsert";
    }

    @GetMapping("search")
    public String search(String keyword, Model model) {
        Map<String, Object> map = productService.searchItems(keyword);

        model.addAttribute("searchList", map.get("searchList"));
        model.addAttribute("keyword", keyword);

        return "/product/searchPage";
    }

    @GetMapping("showOne/{id}")
    public String showOne(HttpSession session, RedirectAttributes redirectAttributes, Model model, @PathVariable int id) {

        ProductDTO p = productService.selectOne(id);
        int logInId = ((MemberDTO)session.getAttribute("logIn")).getId();

        if (p == null) {
            redirectAttributes.addFlashAttribute("message", "존재하지 않는 상품 번호입니다.");
            return "redirect:/";
        }

        model.addAttribute("result", p);
        model.addAttribute("recommendItem", productService.recommendItems());
        model.addAttribute("like", favoriteService.selectProduct(id, logInId));
        model.addAttribute("logInId", logInId);

        return "/product/showOne";
    }

    @GetMapping("productList/{id}/{pageNo}")
    public String showProductList(RedirectAttributes redirectAttributes, Model model, @PathVariable int id, @PathVariable int pageNo) {

        List<ProductDTO> pList = productService.selectSeller(id, pageNo);
        if (pList == null) {
            redirectAttributes.addFlashAttribute("message", "등록된 상품이 존재하지 않습니다..");
            return "redirect:/";
        }

        model.addAttribute("sellerProduct", pList);
        model.addAttribute("paging", setPages(pageNo, productService.selectLastPage(id)));
        model.addAttribute("current", pageNo);
        model.addAttribute("pagingAddr", "/product/productList/" + id);

        return "product/productList";
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
