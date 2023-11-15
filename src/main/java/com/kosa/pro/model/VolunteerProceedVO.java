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
public class VolunteerProceedVO implements GeneralModel {
	
	private static final long serialVersionUID = -2858513294136857815L;
	

	private int volunProceedSeq;	// 신청내역 봉사번호
	private int recruitSeq;			// 해당 봉사신청 게시판 글번호
	private int memSeq;				// 개인회원 번호
	private int groupMemSeq;		// 단체회원 번호
	private String state;			// 상태(신청중/승인/거절)
	private String rejectMessage;	// 거절 메시지
	private String attendance;		// 출석여부
	
	// [별이] 11/13 - 봉사활동 신청내역 승인/거절 페이지에서 필요해서 멤버테이블에서 조인한 필드들임
	private String name;			//	(멤버)이름
    private String gender;			//	(멤버)성별
	private int count;				//	승인된사람 카운트
	private String recruitTitle;	//  신청내역에서 번호대신 제목으로 바꿔달라는 요청때문에 추가
    // [user] 마이페이지 메인 조인 용도 필드
	private String latitude;     	// 위도
	private String longitude;    	// 경도


}
