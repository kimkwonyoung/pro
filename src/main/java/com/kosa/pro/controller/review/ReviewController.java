package com.kosa.pro.controller.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.common.SearchVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review/")
public class ReviewController extends PrtController {
	
	@RequestMapping("list")
	public String reviewList(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("후기게시판 목록", model);
		log.info(">>>>>>>>>>>>>>후기게시판");
//		model.addAttribute("test", getConfig().getAdminName());
		return "review/review_list";
	}

}
