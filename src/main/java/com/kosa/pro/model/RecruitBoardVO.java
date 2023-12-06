package com.kosa.pro.model;

import java.sql.Date;
import java.sql.Timestamp;

import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RecruitBoardVO implements GeneralModel {
	
	private static final long serialVersionUID = 5995424501649148152L;
	
	private int recruitSeq;			// 봉사신청글 번호
	private int groupMemSeq;		// 단체회원번호
	private String groupName;		// 단체 이름
	private String volunRegion1;	// 봉사 지역
	private String volunRegion2;	// 봉사 지역
	private String volunAddr;		// 봉사 장소
	private Date volunStartDate;	// 봉사 시작일
	private Date volunEndDate;		// 봉사 종료일
	private String recruitState;	// 모집 현황(모집중/모집종료/종료)
	private String volunCode;		// 봉사 분야
	private int volunTime;			// 봉사 시간
	private Date recruitStartDate;	// 모집 시작일
	private Date recruitEndDate;	// 모집 종료일
	private int memCount;			// 모집 인원
	private String volunTarget;		// 봉사 대상(신청 가능 대상..? 그런거같음 다시보니)
	private String recruitTitle;	// 글 제목
	private String recruitContent;	// 글 내용
	private int viewCount;			// 조회수
	private Date regDate;			// 작성일
	private Date modDate;			// 수정일
	private String delYn;			// 삭제여부
	private String manager;			// 담당자
	private String email;			// 담당자 이메일
	private String phone;			// 담당자 연락처
	private String latitude;     	// 위도
	private String longitude;    	// 경도

	private String state;			// 조인용 상태(승인/거절)
	private int count;				// 실제 신청인원
	private String rejectMessage;	// 거절 메시지
	private Timestamp volunStartDateTime; // 봉사 시작일과 시간(풀캘린더용)
	private Timestamp volunEndDateTime;	// 봉사 종료일과 시간(풀캘린더용)

}
