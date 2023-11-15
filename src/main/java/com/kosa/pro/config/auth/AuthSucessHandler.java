package com.kosa.pro.config.auth;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.kosa.pro.model.GroupMemberVO;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.service.dao.GeneralDAOImpl;


@Component
public class AuthSucessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Resource
	private GeneralDAOImpl _gDao;
	
	@Override
    public void onAuthenticationSuccess(
    		HttpServletRequest request
    		, HttpServletResponse response
    		, Authentication authentication //로그인한 사용자 정보가 있는 객체 
    		) throws IOException, ServletException {
        
		System.out.println(">>>>권한 체크 = " + authentication.getAuthorities().toString());
		for (GrantedAuthority authority : authentication.getAuthorities()) {
		    if (authority.getAuthority().contains("MANAGER")) {
		    	System.out.println(">>>단체회원 ");
				GroupMemberVO gmember = GroupMemberVO.builder()
						.groupMemId(authentication.getName())
						.build();
				_gDao.update("member.updateGroupMemberLastLogin", gmember);
				_gDao.update("member.loginGroupCountClear", gmember);
				System.out.println(">>>>>그룹멤버 = " + gmember);
			} else {
				System.out.println(">>일반회원");
				MemberVO member = MemberVO.builder()
						.memId(authentication.getName())
						.build();
				_gDao.update("member.updateMemberLastLogin", member);
				_gDao.update("member.loginCountClear", member);
				System.out.println(">>>>>멤버 = " + member);
			}
		}
			
		System.out.println("authentication ->" + authentication);
		
        setDefaultTargetUrl("/main");
        
        super.onAuthenticationSuccess(request, response, authentication);
    }
}
