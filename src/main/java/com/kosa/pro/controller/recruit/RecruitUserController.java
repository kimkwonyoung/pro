//package com.kosa.pro.controller.recruit;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.kosa.pro.config.auth.PrincipalDetails;
//import com.kosa.pro.controller.PrtController;
//import com.kosa.pro.model.RecruitBoardVO;
//import com.kosa.pro.model.VolunteerProceedVO;
//import com.kosa.pro.service.RecruitBoardService;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@Controller
//@RequestMapping("/recruit")
//public class RecruitUserController extends PrtController {
//
//	@Autowired
//	private RecruitBoardService _recruitBoardService;
//	
//	// ============================ 봉사활동 목록 & 상세 페이지 ============================
//	
//
//	
//	/*
//	 * @RequestMapping("info") public String reviewInfo(ReviewSearchVO search, Model
//	 * model, Authentication authentication) { //조회수 증가
//	 * _reviewBoardService.reviewViewCount(search);
//	 * 
//	 * 
//	 * //로그인 유저 데이터 구성 if (authentication != null) { PrincipalDetails principal =
//	 * (PrincipalDetails) authentication.getPrincipal();
//	 * search.setMemAuth(principal.getUser().getLoginAuth());
//	 * search.setMemSeq(principal.getUser().getMemSeq()); }
//	 */
//	
//	/*
//	 * // 봉사활동 - 상세페이지
//	 * 
//	 * @ResponseBody
//	 * 
//	 * @PostMapping("/add") public Map<String, Object> add(@RequestBody
//	 * RecruitBoardVO recruit, VolunteerProceedVO add, Model model) throws Exception
//	 * { super.setPageSubTitle("봉사활동 상세페이지", model);
//	 * log.info(">>>>>>>>>>>>>> 봉사활동 신청하기");
//	 * 
//	 * Map<String, Object> result = new HashMap<>(); int status =
//	 * _recruitBoardService.add(add);
//	 * 
//	 * 
//	 * if(status > 0) { result.put("status", true); result.put("message",
//	 * "봉사신청이 완료되었습니다."); } else { result.put("status", false);
//	 * result.put("message", "오류가 발생했습니다. 다시 시도해주세요."); }
//	 * 
//	 * return result; }
//	 */
//
//	
//	
//} // end class
