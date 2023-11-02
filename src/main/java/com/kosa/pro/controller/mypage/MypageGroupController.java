package com.kosa.pro.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.common.SearchVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageGroupController extends PrtController {

	
	
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
