package com.kosa.pro.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO implements GeneralModel {

	private static final long serialVersionUID = -6872886920468343674L;
	
	private int memSeq;
	private String memId;
	private String name;
	private String gender;
	private String phone;
	private String platform;
	private String auth;
	private String delYn;
	private String benYn;
	private String joinDate;
	
	private String profilImage; // 스프링 시큐리티 작업 하면서 새로 추가(2023.11.07)
	private String pwd;
	private int loginCount;
	private LocalDateTime lastLoginTime;
	
	//VolunteerTimeVO 타입의 필드 추가
	private VolunteerTimeVO volunteerTime;
	

}
