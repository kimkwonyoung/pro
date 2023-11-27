package com.kosa.pro.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.service.admin.AdminIndexService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminMainController {

	@Autowired
	private AdminIndexService _adminIndexService;
	
	@RequestMapping("adminmain")
	public String adminIndex(SearchVO search, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>관리자 메인");
		Map<String, Object> response = _adminIndexService.selectReviewTop5();
	    List<ReviewBoardVO> top5Reviews = (List<ReviewBoardVO>) response.get("selectTop5Reviews");
	    model.addAttribute("top5Reviews", top5Reviews);
	    System.out.println("뭐 있음 " + response);
	    System.out.println("뭐 있음 -> " + top5Reviews);
		return "admin/adminindex";
	}

	// 관리자 페이지 월별 봉사 집계 차트
	@GetMapping("/ChartRecruitBoardCount")
	@ResponseBody
	public Map<String, Object> selectRecruitBoardCount() throws Exception {
		
		Map<String, Object> map = _adminIndexService.selectRecruitBoardCount();
		System.out.println("관리자 차트 월별 봉사 수 -->" + map);
		return map;
	}
	
	// 관리자 페이지 봉사유형별 차트
	 @GetMapping("/ChartCategoryCount")
	 @ResponseBody
	public Map<String, Object> selectCategoryCount() throws Exception {
		
		Map<String, Object> map = _adminIndexService.selectCategoryCount();
		System.out.println("관리자 유형별 카테고리 집계-->" + map);
		return map;
	}
	
		// 관리자 페이지 리뷰 탑5
//	 @GetMapping("/ReviewTop5")
//	    public String selectReviewTop5(Model model) throws Exception {
//		 Map<String, Object> response = _adminIndexService.selectReviewTop5();
//		    List<ReviewBoardVO> top5Reviews = (List<ReviewBoardVO>) response.get("selectTop5Reviews");
//		    model.addAttribute("top5Reviews", top5Reviews);
//		    System.out.println("뭐 있음 " + response);
//		    System.out.println("뭐 있음 -> " + top5Reviews);
//	        return "admin/adminindex"; // JSP 파일 이름
//	    }
//		
	
	
}

