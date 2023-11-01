package com.kosa.pro.model;

import com.kosa.pro.model.general.GeneralModel;

import lombok.Data;

@Data
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
	

}