package com.kosa.pro.model;

import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class VolunteeringVO implements GeneralModel {
	
	private static final long serialVersionUID = 5995424501649148152L;
	
	private int recruitSeq;			// 봉사신청글 번호
	private int groupMemSeq;		// 단체회원번호
	private String state;			// 승인여부

	private int memSeq;				// 멤버번호
	private String name;			// 참여자 이름
	private String attendance;		// 출석여부

}
