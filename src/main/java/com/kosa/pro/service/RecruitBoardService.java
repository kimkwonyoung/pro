package com.kosa.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.RecommendVO;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.VolunteerProceedVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.model.search.RecruitSearchVO;
import com.kosa.pro.service.common.BaseService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RecruitBoardService extends BaseService {
	
	// 신청 목록 페이지
	public Map<String, List<RecruitBoardVO>> recruitList(BoardSearchVO search) throws Exception {
		Map<String, List<RecruitBoardVO>> map = new HashMap<>();
		
		map.put("recruitList", (List<RecruitBoardVO>) getDAO().selectBySearch("recruit.selectRecruitList", search, "totalCount"));
		
		
		return map;
		
	}
	
	// 신청 상세 페이지
	public Object recruitDetail(RecruitBoardVO recruit)  throws Exception {
		
		return getDAO().selectOne("recruit.selectRecruitGet", recruit);
	}
	
	
	// 개인이 신청 등록
	public int add(VolunteerProceedVO add)  throws Exception {
		
		return getDAO().insert("mypage.insertAdd", add);
	}
	
	
	// 신청 등록 페이지
	public int recruitInsert(RecruitBoardVO recruit)  throws Exception {
		
		return getDAO().insert("recruit.insertRecruit", recruit);
	}
	

	// 개인 중복 신청 금지
    public int insertAddCk(VolunteerProceedVO add) {
    	
        return (int) getDAO().selectOne("mypage.insertAddCk", add);
    }
    
	public Map<String, Object> recruitWriteForm(RecruitSearchVO search) {
		Map<String, Object> map = new HashMap<>();
		
		search.setTableName("recruit"); //봉사모집 게시판
		search.setGroupCode("0001");
		map.put("groupCodeList", getDAO().selectList("code.selectGroupCode", search));
		
		return map;
	}
	
	
	

	// 봉사활동 몇 명 신청했는지 조회하기
    public int insertCount(VolunteerProceedVO count) {
    	
        return (int) getDAO().selectOne("mypage.insertCount", count);
    }

	
	

//	
//	
//	// 신청 수정 페이지
//	public Object recruitUpdate(RecruitBoardVO recruit)  throws Exception {
//		
//		return getDAO().selectOne("recruit.updateRecruit", recruit);
//	}
//	
//	
//	// 신청 삭제
//	public Object recruitDelete(RecruitBoardVO recruit)  throws Exception {
//		
//		return getDAO().selectOne("recruit.deleteRecruit", recruit);
//	}
	
	

}
