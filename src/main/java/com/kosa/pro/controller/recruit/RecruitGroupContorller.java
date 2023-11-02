package com.kosa.pro.controller.recruit;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.common.SearchVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recruit")
public class RecruitGroupContorller extends PrtController {

	
	
	// ============================ 봉사활동 목록 & 상세 페이지 ============================
	
	
	// 봉사활동 - 목록 페이지
	@RequestMapping("/list")
	public String recruitList(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사신청 목록 페이지", model);
		log.info(">>>>>>>>>>>>>>리스트");
//		model.addAttribute("test", getConfig().getAdminName());
		return "recruit/recruit_list";
	}
	
	
	// 봉사활동 - 상세페이지
	@RequestMapping("/detail")
	public String recruitDetail(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 상세페이지", model);
		log.info(">>>>>>>>>>>>>>상세보기");
//		model.addAttribute("test", getConfig().getAdminName());
		return "recruit/recruit_detail";
	}
	
	
// ============================ 마이페이지 ============================

	
	// 봉사활동 - 신청 등록 페이지
	@RequestMapping("/register")
	public String recruitRegister(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 등록 페이지", model);
		log.info(">>>>>>>>>>>>>>봉사신청 등록하기");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/recruit_register";
	}
	
} // end class
