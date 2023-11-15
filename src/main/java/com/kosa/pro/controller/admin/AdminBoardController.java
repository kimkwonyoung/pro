package com.kosa.pro.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.model.BoardVO;
import com.kosa.pro.model.GroupMemberVO;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.model.search.GroupMemberSearchVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.admin.AdminBoardService;
import com.kosa.pro.service.admin.AdminMemberService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminBoardController {
	
	@Autowired
	private AdminBoardService _boardService;

	//로딩시 모집 게시판 먼저 보이게
	@RequestMapping("/adminboard")
	public String admingetMainBoard(BoardSearchVO search, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>관리자 회원/단체 관리");
		Map<String, List<RecruitBoardVO>> map = _boardService.adminRecruitboardList(search);
		model.addAttribute("list", map.get("adminRecruitList"));
		model.addAttribute("search", search);
		return "admin/adminboard";
	}


// 모집 게시판 을 가져오는 AJAX 처리 메서드
@GetMapping("/getRecruitBoard")
@ResponseBody
public List<RecruitBoardVO> getRecruitBoard(BoardSearchVO search, Model model) throws Exception {
    log.info("Fetching 모집 AJAX call");
    Map<String, List<RecruitBoardVO>> map = _boardService.adminRecruitboardList(search);
    model.addAttribute("search", search);
    System.out.println("모집 ---------------------------" + map);
    return map.get("adminRecruitList");
}

// 후기 게시판 가져오는 AJAX 처리 메서드
@GetMapping("/getReviewBoard")
@ResponseBody
public List<ReviewBoardVO> getReviewBoard(BoardSearchVO search, Model model) throws Exception {
	   log.info("Fetching 후기 AJAX call");
    Map<String, List<ReviewBoardVO>> map = _boardService.adminReviewboardList(search);
    model.addAttribute("search", search);
    System.out.println("후기게시판" + map);
    return map.get("adminReviewList");
}

}