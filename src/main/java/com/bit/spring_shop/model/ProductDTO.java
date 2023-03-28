package com.bit.spring_shop.model;

import lombok.Data;

import java.sql.Date;

@Data
public class ProductDTO {
    private int id;
    private String name;
    private String image;
    private int sellerId;
    private String sellerName;
    private int categoryId;
    private String description;
    private int price;
    private int sold;
    private Date entryDate;
    private Date modifyDate;
}
