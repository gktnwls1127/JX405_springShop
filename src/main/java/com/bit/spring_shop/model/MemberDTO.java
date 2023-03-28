package com.bit.spring_shop.model;

import lombok.Data;

@Data
public class MemberDTO {
    private int id;
    private String username;
    private String password;
    private String nickname;
    private String role;
}
