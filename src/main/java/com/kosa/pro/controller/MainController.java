package com.kosa.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.service.MainService;
import com.kosa.pro.service.RecruitBoardService;
import com.kosa.pro.service.ReviewBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController extends PrtController {
	
	@Autowired
	MainService _mainService;
	
	@RequestMapping(value = {"/", "main"})
	public String mainIndex(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 메인", model);
		
		model.addAttribute("listTop3", _mainService.mainTop3List()); 
		model.addAttribute("recruitList", _mainService.mainRecruitList());
		model.addAttribute("noticeList", _mainService.mainNoticeList());
		
		return "index";
	}

}
