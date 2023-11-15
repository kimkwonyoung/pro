package com.kosa.pro.config.exception;

import org.springframework.security.core.AuthenticationException;

//멤버가 존재할 경우 예외 객체
public class LoginBenException extends AuthenticationException {
	private static final long serialVersionUID = 7011740113876083169L;

	public LoginBenException(String message) {
		super(message);
	}
}
