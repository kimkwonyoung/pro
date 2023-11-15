package com.kosa.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.common.SearchVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/msg")
public class MsgController extends PrtController {

	// 쪽지함 진입
	@RequestMapping(value={"", "/", "/main"})
	public String msgMain(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("채팅/쪽지", model);
		log.info(">>>>>>>>>>>>>>채팅/쪽지");
//		model.addAttribute("test", getConfig().getAdminName());
		return "msg";
	}

	// 쪽지 보내기로 진입했을 때 쪽지 보내기, 비동기로 작업
	@RequestMapping("/write")
	public String msgWriteFirst(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("채팅/쪽지", model);
		log.info(">>>>>>>>>>>>>>채팅/쪽지");
//		model.addAttribute("test", getConfig().getAdminName());
		return "msg";
	}

//	// 4-1. 게시판 글 삭제
//	@ResponseBody
//	@RequestMapping(value = "/board/delete.do", method = RequestMethod.POST)
//	public Map<String,Object> delete(@RequestBody BoardDTO board, HttpServletRequest req, HttpServletResponse res) throws Exception {
//		System.out.println("board.controller.delete() invoked.");
//		Map<String,Object> jsonResult=new HashMap<>();
//		boolean status = boardService.boardDelete(board.getBoardid());
//		
//		jsonResult.put("status", status);
//		jsonResult.put("message", status ? "글이 삭제되었습니다" : "오류가 발생하였습니다. 다시 시도해주세요.");
//		
//		return jsonResult;
//	} // delete

	// 쪽지 작성, JS에서 비동기로 작업
	@RequestMapping("/writeInForm")
	public String msgWrite(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("채팅/쪽지", model);
		log.info(">>>>>>>>>>>>>>채팅/쪽지");
//		model.addAttribute("test", getConfig().getAdminName());
		return "msg";
	}

	// 쪽지 list 출력, JS에서 비동기로 작업
	@RequestMapping("/read")
	public String msgRead(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("채팅/쪽지", model);
		log.info(">>>>>>>>>>>>>>채팅/쪽지");
//		model.addAttribute("test", getConfig().getAdminName());
		return "msg";
	}

//	// 보류, 보여줄지 아닐지 모름	
	// 쪽지 삭제, JS에서 비동기로 작업
	@RequestMapping("/delete")
	public String msgDelete(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("채팅/쪽지", model);
		log.info(">>>>>>>>>>>>>>채팅/쪽지");
//		model.addAttribute("test", getConfig().getAdminName());
		return "msg";
	}

}
