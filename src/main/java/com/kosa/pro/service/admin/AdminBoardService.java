package com.kosa.pro.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.GroupMemberVO;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.model.search.GroupMemberSearchVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.common.BaseService;

@Service
public class AdminBoardService  extends BaseService{

	
	
	// 모집게시판
	public Map<String, List<RecruitBoardVO>> adminRecruitboardList(BoardSearchVO search) throws Exception {

		Map<String, List<RecruitBoardVO>> map = new HashMap<>();
		map.put("adminRecruitList", (List<RecruitBoardVO>) getDAO().selectBySearch("adminboard.selectRecruitBoardList",
				search, "totalCountrecruit"));
		return map;
	}

	// 후기게시판
	public Map<String, List<ReviewBoardVO>> adminReviewboardList(BoardSearchVO search) throws Exception {
		
		// 단체 회원 리스트를 가져오는 쿼리 실행	
		System.out.println("단체 리스트 ajax 테스트");
		
		Map<String, List<ReviewBoardVO>> groupmap = new HashMap<>();
		
		groupmap.put("adminReviewList", (List<ReviewBoardVO>) getDAO().selectBySearch("adminboard.selectReviewBoardList",
				search, "ReviewtotalCount"));
		
		System.out.println("후기 게시판 -->" + groupmap);
	
		return groupmap;
	}
	
	
	
}
