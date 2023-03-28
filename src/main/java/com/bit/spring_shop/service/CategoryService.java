package com.bit.spring_shop.service;

import com.bit.spring_shop.model.CategoryDTO;
import com.bit.spring_shop.model.MemberDTO;
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
