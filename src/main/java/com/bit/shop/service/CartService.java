package com.bit.shop.service;

import com.bit.shop.model.CartDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CartService {
    private final String NAMESPACE = "mapper.CartMapper";

    private SqlSession session;

    @Autowired
    public CartService(SqlSession session) {
        this.session = session;
    }

    public List<CartDTO> cartALL(int id) {
        return session.selectList(NAMESPACE + ".cartAll", id);
    }
    public CartDTO findCart(int productId, int memberId) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("productId", productId);
        map.put("memberId", memberId);
        return session.selectOne(NAMESPACE + ".findCart", map);
    }

    public int totalPrice(int id) {
        return session.selectOne(NAMESPACE + ".sumCart", id);
    }

    public CartDTO selectOne(int id) {
        return session.selectOne(NAMESPACE + ".selectOne", id);
    }

    public void insert(CartDTO cartDTO) {
        session.insert(NAMESPACE + ".cartInsert", cartDTO);
    }

    public void update(CartDTO attempt) {
        session.update(NAMESPACE + ".cartUpdate", attempt);
    }

    public void delete(int id) {
        session.delete(NAMESPACE + ".cartDelete", id);
    }

    public void memberCartDel(int memberId) {
        session.delete(NAMESPACE + ".memberCartDel", memberId);
    }

    public void ordered(int id) {
        session.update(NAMESPACE + ".ordered", id);
    }

    public int orderedCount(int id){
        return session.selectOne(NAMESPACE + ".countOrdered", id);
    }
}
