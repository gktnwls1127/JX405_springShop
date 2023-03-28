package com.bit.spring_shop.handler;

import com.bit.spring_shop.model.MemberCustomDetails;
import com.bit.spring_shop.model.MemberDTO;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Service
public class memberAuthSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        //System.out.println(authentication.getName());
        //System.out.println(authentication.getDetails());
        MemberDTO memberDTO = ((MemberCustomDetails)authentication.getPrincipal()).getMemberDTO();
        memberDTO.setPassword(null);
        // 세션 정보 저장
        HttpSession session = httpServletRequest.getSession();
        session.setAttribute("logIn", memberDTO);

        httpServletResponse.sendRedirect("/");
    }
}
