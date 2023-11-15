package com.kosa.pro.config.auth;

import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import com.kosa.pro.config.exception.LoginBenException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@Component
public class AuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
		
	    String msg = "오류";
	    // exception 관련 메세지 처리
	    if (exception instanceof LockedException) {
        	msg = "정지된 계정 입니다.";
	    } else if (exception instanceof DisabledException) {
        	msg = "비 활성화된 계정 입니다.";
        } else if(exception instanceof CredentialsExpiredException) {
        	msg = "만료된 계정 입니다.";
        } else if(exception instanceof BadCredentialsException ) {
        	msg = "아이디 또는 비밀번호가 다릅니다.";
        } else if(exception instanceof LoginBenException) {
        	msg = exception.getMessage();
        }
	    String encodedMsg = URLEncoder.encode(msg, "UTF-8");
	    
	    setDefaultFailureUrl("/auth/loginForm?error=true&exception=" + encodedMsg);
	
	    super.onAuthenticationFailure(request, response, exception);
	}
}
