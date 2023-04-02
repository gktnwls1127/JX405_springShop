package com.bit.shop.service;

import com.bit.shop.model.ProductDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {
    private final int PAGE_SIZE = 10;

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

    public List<ProductDTO> selectAll(int pageNo){
        HashMap<String, Integer> params = new HashMap<>();
        params.put("start", (pageNo-1) * PAGE_SIZE);
        params.put("size", PAGE_SIZE);
        return session.selectList(NAMESPACE + ".selectAll", params);
    }
    public List<ProductDTO> selectSeller(int id, int pageNo){
        HashMap<String, Integer> params = new HashMap<>();
        params.put("id", id);
        params.put("start", (pageNo-1) * PAGE_SIZE);
        params.put("size", PAGE_SIZE);
        return session.selectList(NAMESPACE + ".selectSeller", params);
    }

    public List<ProductDTO> recommendItems(){
        return session.selectList(NAMESPACE + ".recommendItems");
    }

    public Map<String, Object> searchItems(String keyword){
        Map<String, Object> result = new HashMap<>();
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);

        result.put("searchList", session.selectList(NAMESPACE + ".searchItems", params));
        return result;
    }

    public List<ProductDTO> categoryAll(int categoryId){
        return session.selectList(NAMESPACE + ".categoryAll", categoryId);
    }
    public ProductDTO selectOne(int id){
        return session.selectOne(NAMESPACE + ".selectOne", id);
    }

    public int selectLastPage(int id){
        int count = session.selectOne(NAMESPACE + ".count", id);
        int total = count / PAGE_SIZE;
        if (count % PAGE_SIZE != 0){
            total++;
        }
        return total;
    }

    public int selectLastPageAll(){
        int count = session.selectOne(NAMESPACE + ".countAll");
        int total = count / PAGE_SIZE;
        if (count % PAGE_SIZE != 0){
            total++;
        }
        return total;
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
