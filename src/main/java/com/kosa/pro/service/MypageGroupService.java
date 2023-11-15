package com.kosa.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.GroupMemberVO;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.VolunteerProceedVO;
import com.kosa.pro.model.VolunteerRecordVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.service.common.BaseService;
import com.kosa.pro.websoket.AttendanceWebSoketHandler;

import lombok.extern.slf4j.Slf4j;

/**
 * 마이페이지(단체) 게시판
 * 
 * @author 
 *
 */
@Service
@Slf4j
public class MypageGroupService extends BaseService {
	
	private AttendanceWebSoketHandler handler;
	
	// 마이페이지 - 메인
	public Map<String, List<GroupMemberVO>> memberVO(GroupMemberVO vo) throws Exception {
		System.out.println("마이페이지(단체) 메인 페이지 서비스 진입");
		
		Map<String, List<GroupMemberVO>> map = new HashMap<>();
		map.put("member", (List<GroupMemberVO>) getDAO().selectList("mypage.mainList", vo));
		
		return map;	
	}
	

	/**
	 * 신청 수락/거절 페이지 기존 신청 내역 1. state 부분을 수락/거절로 변경할 것 2. 확정일 당일 날짜로 변경할 것
	 */
	// 신청확인(수락/거절) 목록
	public Map<String, List<VolunteerProceedVO>> volunteerProceedList(VolunteerProceedVO vo) throws Exception {
		System.out.println("신청 수락/거절 페이지 서비스 진입");
		
		
		
		Map<String, List<VolunteerProceedVO>> map = new HashMap<>();
		map.put("state", (List<VolunteerProceedVO>) getDAO().selectList("mypage.volunteerProceedList", vo));

		System.out.println("신청 수락/거절 map -> " + map);

		return map;
	}

	// 신청확인(수락) 목록
	public Map<String, List<VolunteerProceedVO>> approve(VolunteerProceedVO vo) throws Exception {
		System.out.println("신청 수락 페이지 서비스 진입");

		Map<String, List<VolunteerProceedVO>> map = new HashMap<>();
		map.put("approve", (List<VolunteerProceedVO>) getDAO().selectList("mypage.selectApprove", vo));

		System.out.println("수락 map -> " + map);

		return map;
	}
	
	// 신청확인(거절) 목록
	public Map<String, List<VolunteerProceedVO>> reject(VolunteerProceedVO vo) throws Exception {
		System.out.println("신청 거절 페이지 서비스 진입");

		Map<String, List<VolunteerProceedVO>> map = new HashMap<>();
		map.put("reject", (List<VolunteerProceedVO>) getDAO().selectList("mypage.selectreject", vo));

		System.out.println("거절 map -> " + map);

		return map;
	}
	
	// 신청 수락
	public int updateApprove(VolunteerProceedVO vpvo) throws Exception {
		System.out.println("신청 수락 서비스 진입");

		return getDAO().update("mypage.updateApprove", vpvo);
	}
	
	// 신청 거절
	public int updateReject(VolunteerProceedVO vpvo) throws Exception {
		System.out.println("신청 거절 서비스 진입");

		return getDAO().update("mypage.updateReject", vpvo);
	}

	
	
	
	/**
	 * 진행 중인 봉사 페이지 기존 신청 내역 1. 같은페이지 1-1. 당일 봉사활동 목록 리스트 1-2. 일주일 이내 봉사활동 목록 리스트 2.
	 * 상세 페이지 2-1. 진행 중인 봉사 상세페이지
	 * 
	 */
	
	// 4-1. 당일 봉사활동 목록
	public Map<String, List<RecruitBoardVO>> selectVolunteeringList(RecruitBoardVO vo) throws Exception {
		System.out.println("당일 봉사활동 목록 서비스 진입");

		Map<String, List<RecruitBoardVO>> map = new HashMap<>();
		map.put("today", (List<RecruitBoardVO>) getDAO().selectList("mypage.selectVolunteeringList", vo));

		return map;
	}

	// 4-2. 일주일 이내 봉사활동 목록
	public Map<String, List<RecruitBoardVO>> selectVolunteeringListWithinAWeek(RecruitBoardVO vo) throws Exception {
		System.out.println("일주일 이내 봉사활동 목록 서비스 진입");

		Map<String, List<RecruitBoardVO>> map = new HashMap<>();
		map.put("withinAWeek", (List<RecruitBoardVO>) getDAO().selectList("mypage.selectVolunteeringListWithinAWeek", vo));

		return map;
	}

	// 4-3. 진행 중인 봉사 상세
	public Map<String, List<VolunteerProceedVO>> volunteering(VolunteerProceedVO vo) throws Exception {
	 
		Map<String, List<VolunteerProceedVO>> map = new HashMap<>();
		map.put("volunteer", (List<VolunteerProceedVO>) getDAO().selectList("mypage.selectVolunteeringMember", vo));

	    return map; 
	}
	
	// 4-4. 진행 중인 봉사 출석조회
	/*
	 * public Map<String, List<VolunteerRecordVO>> selectAttendance(BoardSearchVO
	 * search) throws Exception {
	 * 
	 * Map<String, List<VolunteerRecordVO>> map = new HashMap<>();
	 * map.put("selectAttendance", (List<VolunteerRecordVO>)
	 * getDAO().selectBySearch("mypage.selectAttendance", search, "totalCount"));
	 * 
	 * return map; }
	 */
	
	
	// 4-4. 진행 중인 봉사 출석체크
	public Object addAttendance (VolunteerRecordVO attendance) throws Exception {
		
		// 출석체크 완료
		getDAO().insert("mypage.attendance", attendance); 
		VolunteerRecordVO vo = (VolunteerRecordVO) getDAO().selectByKey("mypage.selectAttendance", attendance);
		
		// 출석체크 현황을 모든 클라이언트에게 통지하기
		handler.attendanceY(vo);
		
	    return vo;
	}
	
	 
	/*
	 * public List<?> selectList(String sqlMapID, Object vo) { return
	 * sqlSession.selectList(sqlMapID, vo); }
	 */
		
		



	/*
	 * public Map<String, List<VolunteerProceedVO>> volunteering(VolunteerProceedVO
	 * volunteer) throws Exception { Map<String, List<VolunteerProceedVO>> map = new
	 * HashMap<>(); List<VolunteerProceedVO> volunteerList =
	 * (List<VolunteerProceedVO>)
	 * getDAO().selectList("mypage.selectVolunteeringMember", volunteer);
	 * map.put("volunteer", volunteerList); return map; }
	 */


	 

} // end class
