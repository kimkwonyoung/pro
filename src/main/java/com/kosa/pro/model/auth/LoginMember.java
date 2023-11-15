package com.kosa.pro.model.auth;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class LoginMember implements GeneralModel {

	private static final long serialVersionUID = -6184553356044157171L;
	
	private String loginId;
	private String loginName;
	private String loginPwd;
	private String loginAuth;
	private int loginCount;
	private String benYn;
	private int memSeq;
	
	//구글 로그인
	private String provider;
	private String providerId;
	
	// ENUM으로 안하고 ,로 해서 구분해서 ROLE을 입력 -> 그걸 파싱!!
	// 예제 ROLL 값 : "ROLE_USER","ROLE_MANAGER","ROLE_ADMIN"  
	public List<String> getRoleList() {
	    if (this.loginAuth.length() > 0) {
	        return Arrays.asList(this.loginAuth.split(","));
	    }
	    return new ArrayList<>();
	}

}
