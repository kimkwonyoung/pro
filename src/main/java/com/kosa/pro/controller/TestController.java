package com.kosa.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.service.BoardService;

/**메인 컨트롤러
 * @author kky
 *
 */
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class TestController extends PrtController {
	@Autowired
	private BoardService _boardService;
	
//	@RequestMapping("main.do")
//	public String mainIndex(SearchVO search, Model model) throws Exception {
//		log.info(">>>>>>>>>>>>>>ㅇㅇㅇㅇㅇ");
////		model.addAttribute("test", getConfig().getAdminName());
//		model.addAttribute("testlist", _boardService.testList(search));
//		return "main";
//	}
	
	@RequestMapping(value = "boardlist.do")
	public String boardList(BoardSearchVO search, Model model) throws Exception {
		model.addAttribute("list", _boardService.boardList(search));
		model.addAttribute("search", search);
		
		return "board/boardlist";
	}
	
	@RequestMapping(value = "boardWrite.do")
	public String boardWrite(Model model) {
		
		return "board/test";
	}
	@RequestMapping(value = "ckeditor.do")
	public String ckeditor(Model model) {
		
		return "board/form_write";
	}
}
