package com.kosa.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.common.SearchVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController extends PrtController {
	
	@RequestMapping("main")
	public String mainIndex(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 메인", model);
		log.info(">>>>>>>>>>>>>>메인");
//		model.addAttribute("test", getConfig().getAdminName());
		return "index";
	}

}
