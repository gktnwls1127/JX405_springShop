package com.bit.shop.service;

import com.bit.shop.model.CategoryDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    private final String NAMESPACE = "mapper.CategoryMapper";

    private SqlSession session;

    @Autowired
    public CategoryService(SqlSession session){
        this.session = session;
    }

    public List<CategoryDTO> selectAll(){
        return session.selectList(NAMESPACE + ".selectAll");
    }
}
