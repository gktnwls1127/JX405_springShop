package com.bit.spring_shop.service;

import com.bit.spring_shop.model.MemberDTO;
import com.bit.spring_shop.model.ProductDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Service
public class ProductService {
    private final String NAMESPACE = "mapper.ProductMapper";

    private SqlSession session;

    @Autowired
    public ProductService(SqlSession session){
        this.session = session;
    }

    public List<ProductDTO> selectNew(){
        return session.selectList(NAMESPACE + ".selectNew");
    }
    public List<ProductDTO> selectBest(){
        return session.selectList(NAMESPACE + ".selectBest");
    }


    public List<ProductDTO> selectAll(){
        return session.selectList(NAMESPACE + ".selectAll");
    }

    public List<ProductDTO> recommendItems(){
        return session.selectList(NAMESPACE + ".recommendItems");
    }

    public List<ProductDTO> categoryAll(int categoryId){
        return session.selectList(NAMESPACE + ".categoryAll", categoryId);
    }
    public ProductDTO selectOne(int id){
        return session.selectOne(NAMESPACE + ".selectOne", id);
    }

    public void insert(ProductDTO productDTO){
        session.insert(NAMESPACE + ".insert", productDTO);
    }

    public void update(ProductDTO attempt){
        session.update(NAMESPACE + ".update", attempt);
    }

    public void delete(int id){
        session.delete(NAMESPACE+".delete", id);
    }

}
