package com.kosa.pro.config.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.kosa.pro.model.GroupMemberVO;
import com.kosa.pro.model.auth.LoginMember;

/*
isAccountNonExpired(): 이 메서드는 사용자 계정의 유효 기간을 확인합니다. 
일반적으로 계정의 유효 기간이 만료되었는지 확인합니다. 예를 들어, 만료된 계정은 로그인을 허용하지 않을 수 있습니다. 
데이터베이스에서 계정의 만료 날짜를 가져와 비교하여 계정이 만료되었는지 확인할 수 있습니다.

isAccountNonLocked(): 이 메서드는 사용자 계정이 잠긴 상태인지 확인합니다. 잠긴 계정은 로그인을 허용하지 않을 수 있습니다. 
데이터베이스에서 계정의 잠금 상태를 가져와 비교하여 계정이 잠긴 상태인지 확인할 수 있습니다.

isCredentialsNonExpired(): 이 메서드는 사용자 자격 증명(일반적으로 비밀번호)의 유효 기간을 확인합니다. 
만료된 자격 증명은 로그인을 허용하지 않을 수 있습니다. 
데이터베이스에서 사용자 자격 증명의 만료 날짜 또는 유효 기간을 가져와 비교하여 자격 증명이 만료되었는지 확인할 수 있습니다.

isEnabled(): 이 메서드는 사용자 계정이 활성화되었는지 확인합니다. 비활성화된 계정은 로그인을 허용하지 않을 수 있습니다. 
데이터베이스에서 계정의 활성화 상태를 가져와 비교하여 계정이 활성화된 상태인지 확인할 수 있습니다.
 * */

public class PrincipalDetails implements UserDetails, OAuth2User {

    private static final long serialVersionUID = -951226953749557253L;
	private LoginMember user;
	private Map<String, Object> attributes; // 구글 로그인 정보


    public PrincipalDetails(LoginMember user, Map<String, Object> attributes) {
        this.user = user;
        this.attributes = attributes;
    }
    
    public LoginMember getUser() {
        return user;
    }

    @Override
    public String getPassword() {
        return user != null ? user.getLoginPwd() : "";
    }

    @Override
    public String getUsername() {
        return user != null ? user.getLoginId() : "";
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
    	return !"Y".equals(user.getBenYn());

    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
    	return !"Y".equals(user.getBenYn());
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        user.getRoleList().forEach(r -> {
            authorities.add(() -> {
                return "ROLE_" + r;
            });
        });
        return authorities;
    }

	@Override
	public String toString() {
		return "PrincipalDetails [user=" + user + "]";
	}

	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}
    
}
