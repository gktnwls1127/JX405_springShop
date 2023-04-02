package com.bit.shop.service;

import com.bit.shop.model.BuyingDTO;
import com.bit.shop.model.CartDTO;
import com.bit.shop.model.ProductDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class BuyingService {
    private final int PAGE_SIZE = 10;

    private final String NAMESPACE = "mapper.BuyingMapper";

    private SqlSession session;

    @Autowired
    public BuyingService(SqlSession session){
        this.session = session;
    }

    public List<BuyingDTO> selectAll(int pageNo){
        HashMap<String, Integer> params = new HashMap<>();
        params.put("start", (pageNo-1) * PAGE_SIZE);
        params.put("size", PAGE_SIZE);
        return session.selectList(NAMESPACE + ".selectAll", params);
    }
    public List<BuyingDTO> memberOrder(int id, int pageNo){
        HashMap<String, Integer> params = new HashMap<>();
        params.put("id", id);
        params.put("start", (pageNo-1) * PAGE_SIZE);
        params.put("size", PAGE_SIZE);
        return session.selectList(NAMESPACE + ".orderAll", params);
    }

    public List<BuyingDTO> orderSeller(int id, int pageNo){
        HashMap<String, Integer> params = new HashMap<>();
        params.put("id", id);
        params.put("start", (pageNo-1) * PAGE_SIZE);
        params.put("size", PAGE_SIZE);
        return session.selectList(NAMESPACE + ".sellerAll", params);
    }
    public int selectLastPageAll(){
        int count = session.selectOne(NAMESPACE + ".countAll");
        int total = count / PAGE_SIZE;
        if (count % PAGE_SIZE != 0){
            total++;
        }
        return total;
    }

    public int selectLastPage(int id){
        int count = session.selectOne(NAMESPACE + ".count", id);
        int total = count / PAGE_SIZE;
        if (count % PAGE_SIZE != 0){
            total++;
        }
        return total;
    }

    public int selectSellerLastPage(int id){
        int count = session.selectOne(NAMESPACE + ".countSeller", id);
        int total = count / PAGE_SIZE;
        if (count % PAGE_SIZE != 0){
            total++;
        }
        return total;
    }

    public int dateGroup(int id, Date entryDate) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("entryDate", entryDate);
        return session.selectOne(NAMESPACE + ".dateCount", params);
    }

    public int dateGroupSeller(int id, Date entryDate) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("entryDate", entryDate);
        return session.selectOne(NAMESPACE + ".dateCountSeller", params);

    }

    public BuyingDTO selectOne(int id) {
        return session.selectOne(NAMESPACE + ".selectOne", id);
    }

    public void updateProcess(BuyingDTO attempt){
        session.update(NAMESPACE + ".update", attempt);
    }

    public void insert(BuyingDTO buyingDTO) {
        session.insert(NAMESPACE + ".insert", buyingDTO);
    }
}
