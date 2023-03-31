package com.bit.shop.service;

import com.bit.shop.model.MemberCustomDetails;
import com.bit.shop.model.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService implements UserDetailsService {
    private final String NAMESPACE = "mapper.MemberMapper";

    private SqlSession session;
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public MemberService(SqlSession session, BCryptPasswordEncoder passwordEncoder){
        this.session = session;
        this.passwordEncoder = passwordEncoder;
    }

    public MemberDTO auth(MemberDTO attempt){
        return session.selectOne(NAMESPACE + ".auth", attempt);
    }

    public boolean validate(String username){
        return session.selectOne(NAMESPACE + ".validate", username) == null;
    }

    public boolean register(MemberDTO attempt){
        String encodePassword = passwordEncoder.encode(attempt.getPassword());
        attempt.setPassword(encodePassword);

        if (validate(attempt.getUsername())){
            session.selectOne(NAMESPACE + ".register", attempt);
            return true;
        } else {
            return false;
        }

    }

    public List<MemberDTO> selectAll(){
        return session.selectList(NAMESPACE + ".selectAll");
    }

    public void update(MemberDTO attempt){
        session.update(NAMESPACE + ".update", attempt);
    }


    public void delete(int id){
        session.delete(NAMESPACE + ".delete", id);
    }

    public MemberDTO selectOne(int id){
        return session.selectOne(NAMESPACE + ".selectOne", id);
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        MemberDTO member = session.selectOne(NAMESPACE + ".validate", s);
        if (member != null){ //해당 회원을 찾음
            return new MemberCustomDetails(member);

        }
        return null;
    }
}
