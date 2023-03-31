package com.bit.shop.service;

import com.bit.shop.model.CartDTO;
import com.bit.shop.model.FavoriteDTO;
import com.bit.shop.model.ProductDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class FavoriteService {
    private final int PAGE_SIZE = 10;
    private final String NAMESPACE = "mapper.FavoriteMapper";

    private SqlSession session;

    @Autowired
    public FavoriteService(SqlSession session){
        this.session = session;
    }

    public FavoriteDTO selectProduct(int id , int memberId) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("mId", memberId);
        params.put("pId", id);
        return session.selectOne(NAMESPACE + ".findLike", params);
    }

    public List<FavoriteDTO> memberLike(int id, int pageNo){
        HashMap<String, Integer> map = new HashMap<>();
        map.put("id", id);
        map.put("start", (pageNo-1) * PAGE_SIZE);
        map.put("size", PAGE_SIZE);
        return session.selectList(NAMESPACE + ".memberLikeAll", map);
    }

    public int selectLastPage(int id){
        int count = session.selectOne(NAMESPACE + ".count", id);
        int total = count / PAGE_SIZE;
        if (count % PAGE_SIZE != 0){
            total++;
        }
        return total;
    }
    public void insert(FavoriteDTO favoriteDTO) {
        session.insert(NAMESPACE + ".likeUp", favoriteDTO);
    }

    public void delete(int id) {
        session.delete(NAMESPACE + ".likeDelete", id);
    }
}
