package com.kosa.pro.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.common.SearchVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminMainController {

	
	@RequestMapping("adminmain")
	public String adminIndex(SearchVO search, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>관리자 메인");
//		model.addAttribute("test", getConfig().getAdminName());
		return "admin/adminindex";
	}

}

