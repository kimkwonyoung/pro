package com.kosa.pro.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.NoticeVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.NoticeSearchVO;
import com.kosa.pro.service.admin.AdminNoticeService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminNoticeController {
	
	@Autowired
	AdminNoticeService _adminnoticeService;

	@RequestMapping("/adminnotice")
	public String adminMangementMain(NoticeSearchVO search, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>관리자 공지사항");
		
		List<NoticeVO> adminnoticeList = _adminnoticeService.AdminNoticeList(search).get("noticeList");
		System.out.println("--noticeList-- : " + adminnoticeList);
		model.addAttribute("adminnoticeList", adminnoticeList);
		model.addAttribute("search", search);
		return "admin/adminnotice";
	}
}
