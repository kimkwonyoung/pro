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
public class GroupMemberVO implements GeneralModel {

	private static final long serialVersionUID = -6872886920468343674L;
	
	private int groupMemSeq;		// 그룹 번호
	private String groupMemId;		// 그룹 아이디
	private String groupName;		// 그룹 이름
	private String groupPwd;		// 그룹 비번
	private String groupNumber;		// 그룹 비영리단체번호
	private String groupPhone;		// 그룹 연락처
	private String groupAuth;		// 그룹 권한
	private String groupDelYn;		// 그룹 삭제여부
	private String groupJoinDate;	// 그룹 가입일
	
	private int loginCount;
	private LocalDateTime lastLoginTime;
	
	// 평점 테이블 추가
	private GradeVO grade;
	

}
