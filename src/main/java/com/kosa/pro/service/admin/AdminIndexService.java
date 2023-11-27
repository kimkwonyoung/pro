package com.kosa.pro.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.MasterCodeVO;
import com.kosa.pro.service.common.BaseService;

@Service
public class AdminIndexService extends BaseService{

	
	// 월별봉사 카운트 차트 서비스 메소드
	public Map<String, Object> selectRecruitBoardCount() {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("selectMonthRecruitCount", (List<MasterCodeVO>) getDAO().selectList("AdminIndex.selectMonthRecruitCount", map));

		return map;
	}
	
	
	//카테고리 카운트 차트 서비스 메소드
	public Map<String, Object> selectCategoryCount() {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("selectCategoryCount", (List<MasterCodeVO>) getDAO().selectList("AdminIndex.selectCategoryCount", map));
		
		return map;
	}
	
	//후기 게시글 탑 5
	public Map<String, Object> selectReviewTop5(){
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("selectTop5Reviews", (List<MasterCodeVO>) getDAO().selectList("AdminIndex.selectTop5Reviews", map));
		
		return map;
	}
	
}
