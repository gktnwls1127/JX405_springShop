package com.bit.shop.model;

import lombok.Data;
import java.sql.Date;

@Data
public class BuyingDTO {
    private int id;
    private int memberId;
    private int cartId;
    private int totalPrice;
    private String processing;
    private Date entryDate;

    private int productCount;

    private int productId;
    private String name;
    private int sellerId;
    private String image;
    private int price;

    private String username;
}
