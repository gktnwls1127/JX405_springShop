package com.bit.spring_shop.controller;

import com.bit.spring_shop.model.MemberDTO;
import com.bit.spring_shop.model.ProductDTO;
import com.bit.spring_shop.service.CategoryService;
import com.bit.spring_shop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;

@Controller
@RequestMapping("/product/")
public class ProductController {
    private ProductService productService;
    private CategoryService categoryService;
    private String uploadFolder = "/resources/upload";
    public ProductController(ProductService productService, CategoryService categoryService){
        this.productService = productService;
        this.categoryService = categoryService;
    }

    @GetMapping("upsert")
    public String showUpsert(Model model){
        model.addAttribute("categoryList", categoryService.selectAll());
        return "/product/upsert";
    }

    @PostMapping("upsert")
    public String upsert(HttpSession session, MultipartFile[] uploadFile, String attemptId, ProductDTO productDTO){
        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

        String savePath="upload"; // 저장하고싶은 파일,
        ServletContext context = session.getServletContext();//프로젝트 절대경로
        String uploadFilePath = context.getRealPath(savePath);


        for(MultipartFile multipartFile : uploadFile ) {
            System.out.println("upload file name:" + multipartFile.getOriginalFilename());
            System.out.println("upload file name:" + multipartFile.getSize());

            File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename()); //uploadFolder 주소 밑에 경로 생성
            try {
                multipartFile.transferTo(saveFile); //파일을 이동해서 복사 (업로드됨)
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (attemptId.matches("^\\d+$")){
            productDTO.setId(Integer.parseInt(attemptId));
            ProductDTO origin = productService.selectOne(productDTO.getId());
            origin.setName(productDTO.getName());
            origin.setDescription(productDTO.getDescription());
            origin.setImage(productDTO.getImage());
            origin.setCategoryId(productDTO.getCategoryId());
            origin.setPrice(productDTO.getPrice());
            productService.update(origin);
        } else {
            productDTO.setSellerId(logIn.getId());
            productService.insert(productDTO);
        }
        return "redirect:/product/showOne/"+productDTO.getId();

    }

    @GetMapping("category/{categoryId}")
    public String showCategory(Model model, @PathVariable int categoryId){
        model.addAttribute("list", productService.categoryAll(categoryId));
        return "/product/category";
    }

    @GetMapping("showOne/{id}")
    public String showOne(HttpSession session, RedirectAttributes redirectAttributes, Model model, @PathVariable int id){

        ProductDTO p = productService.selectOne(id);
        if (p == null){
            redirectAttributes.addFlashAttribute("message", "존재하지 않는 상품 번호입니다.");
            return "redirect:/";
        }

        model.addAttribute("result", p);
        model.addAttribute("recommendItem", productService.recommendItems());
        //int logInId = ((MemberDTO)session.getAttribute("logIn")).getId();
        //model.addAttribute("logInId", logInId);

        return "/product/showOne";
    }
}
