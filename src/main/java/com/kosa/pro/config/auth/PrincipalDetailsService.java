package com.kosa.pro.config.auth;

import java.util.Optional;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.kosa.pro.config.exception.LoginBenException;
import com.kosa.pro.config.exception.NotExistMemberException;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.VolunteerTimeVO;
import com.kosa.pro.model.auth.LoginMember;
import com.kosa.pro.service.common.BaseService;
import com.kosa.pro.service.dao.GeneralDAOImpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PrincipalDetailsService extends DefaultOAuth2UserService implements UserDetailsService {
	@Resource
	private GeneralDAOImpl _gDao;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("단체회원 로그인 : 진입");

		LoginMember member = (LoginMember) _gDao.selectOne("member.findMemid", username);
		
		//로그인 카운트 증가
		_gDao.update("member.loginCountInc", member);
		
		log.info(">>>>>>최종 로그인 회원 정보 = " + member);
		return new PrincipalDetails(member, null);
	}
	
	@Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("구글 로그인 진입");
		OAuth2User oAuth2User = super.loadUser(userRequest);
			
		log.info("구글 정보 : getAttributes : {}", oAuth2User.getAttributes());
		
		String provider = userRequest.getClientRegistration().getRegistrationId(); // 값 : google
        String profileImage = oAuth2User.getAttribute("picture");
        String email = oAuth2User.getAttribute("email");
        String name = oAuth2User.getAttribute("name"); 
		
        MemberVO member =  (MemberVO) _gDao.selectOne("member.selectMemId", email);
        log.info("셀렉트 멤버 = " + member);
        MemberVO mem;
        if (member == null) {
        	mem = MemberVO.builder()
        			.memId(email)
        			.name(name)
        			.platform(provider)
        			.profilImage(profileImage)
        			.auth("USER")
        			.build();
        	_gDao.insert("member.insert", mem);
        	log.info(">>>>>>구글회원가입 됐니?");
    		MemberVO volunmember = (MemberVO) _gDao.selectOne("member.selectMemId", mem.getMemId());
        	
    		VolunteerTimeVO voluntime = VolunteerTimeVO.builder()
					.memSeq(volunmember.getMemSeq())
					.build();
    		_gDao.insert("member.insertVolunteerTime", voluntime);
    		log.info(">>>>>>회원온도테이블 추가 됐니?");
        }
        mem = member;
        
        LoginMember loginmem = LoginMember.builder()
        						.loginAuth(mem.getAuth())
        						.loginId(mem.getMemId())
        						.loginName(mem.getName())
        						.memSeq(mem.getMemSeq())
        						.build();
        log.info(">>>>>>최종 로그인 회원 정보 = " + loginmem);
        
        return new PrincipalDetails(loginmem, oAuth2User.getAttributes());
    }
}
