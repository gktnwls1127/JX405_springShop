package com.bit.shop.model;

import lombok.Data;

@Data
public class CartDTO {
    private int id;
    private int memberId;
    private int productId;
    private int productCount;
    private String order;
    private String name;
    private String image;
    private int price;
}
