package com.bit.shop.model;

import lombok.Data;

@Data
public class FavoriteDTO {
    private int id;
    private int memberId;
    private int productId;
    private String name;
    private String image;
    private int price;
    private String description;
    private int categoryId;
    private String categoryName;
}
