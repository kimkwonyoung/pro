package com.kosa.pro.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.search.UserSearchVO;
import com.kosa.pro.service.common.BaseService;

@Service
public class UserService extends BaseService {
	
	// [개인] 마이페이지 메인 화면 출력 메소드
	public Map<String, Object> userMain(UserSearchVO search) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		map.put("profil", (MemberVO) getDAO().selectOne("user.selectProfilImage", search)); // 프사 획득하기
		map.put("volunteerProceed", getDAO().selectOne("user.selectVolunteerProceed", search)); // 진행중 봉사 획득 용도
		map.put("volunteerTime", getDAO().selectOne("user.selectVolunteerTime", search)); // 봉사 온도 획득 용도
		map.put("volunteerRecord", getDAO().selectOne("user.volunteerRecord", search)); // 타임인 타임아웃 시간 획득 용도
		return map;
	}
	
	// 봉사활동 출석 시 데이터 insert. volunteer_proceed->volunteer_record
	public boolean attend(UserSearchVO search) {
	    System.out.println(">>>>>>>>>>>>>>서비스 - attend 메소드");
	    int rowsInserted = getDAO().insert("user.volunteerAttend", search);
	    return rowsInserted > 0;
	}
	
	// 봉사활동 종료 시 시간 업데이트
	// 봉사활동 종료 시 퇴근 찍으면 timeout 찍히는 용도
	// volunteer_time 테이블의 volun_addtime 컬럼도 업데이트하는 용도
	public boolean recordUpdate(UserSearchVO search) {
		boolean success = (getDAO().update("user.recordUpdate", search)>0
						   &&
						   getDAO().update("user.updateVolunteerTime", search)>0				
						  );
		return success;
	}
	
	// 봉사활동 종료 시 시간 업데이트
	public int updateTemperature(UserSearchVO search) {
		return getDAO().update("user.updateTemperature", search);
	}

	// 풀캘린더 데이터 조회
	public List<RecruitBoardVO> scheduleFind(UserSearchVO search) {
//		List<RecruitBoardVO> map = new ArrayList<>();
//		map=(List<RecruitBoardVO>) getDAO().selectList("user.calendarList" , search );
//				
//		return map;
		return (List<RecruitBoardVO>) getDAO().selectList("user.calendarList", search);
	}
	
	
	// [개인] 종료된 봉사
	public Map<String, Object> finishedList(UserSearchVO search) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("finishedList", (List<RecruitBoardVO>) getDAO().selectBySearch("user.selectFinishedList", search,"finishedTotalCount"));
		
		return map;
	}

	// [개인] 나의 봉사 목록
	public Map<String, Object> proceedingList(UserSearchVO search) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("proceedingList", (List<RecruitBoardVO>) getDAO().selectBySearch("user.selectRecruitList", search,"recruitingTotalCount"));
		
		return map;
	}
	// [개인] 내가 쓴 후기
	public Map<String, Object> reviewedList(UserSearchVO search) {
		Map<String, Object> map = new HashMap<>();
		System.out.println("진입점");
		map.put("reviewedList", (List<ReviewBoardVO>) getDAO().selectBySearch("user.selectReviewList", search,"reviewedTotalCount"));
		System.out.println("출력잘되나");
		System.out.println(map);
		return map;
	}

}
