package com.kosa.pro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.service.BoardService;
import com.kosa.pro.service.test.ChatRoom;
import com.kosa.pro.service.test.ChatRoomService;

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
	
	@Autowired
	private ChatRoomService chatRoomService;
	
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
	
	@RequestMapping(value = "chattest")
	public String chatTest(Model model) {
		
		return "test/adminChatting";
	}

	@GetMapping("/chat/roomList")
	public String roomList(Model model) {
		return "test/roomList";
	}

	@GetMapping("/chat/rooms")
	@ResponseBody
	public List<ChatRoom> rooms() {
		System.out.println("테스트룸스");
		return chatRoomService.findAllRoom();
	}

	@PostMapping("/chat/room")
	@ResponseBody
	public ChatRoom createRoom(@RequestParam String name) {
		return chatRoomService.createChatRoom(name);
	}

	@GetMapping("/chat/room/enter/{roomId}")
	public String roomEnter(Model model, @PathVariable String roomId) {
		model.addAttribute("roomId", roomId);
		return "test/chatRoom";
	}

	@GetMapping("/chat/room/{roomId}")
	@ResponseBody
	public ChatRoom roomInfo(@PathVariable String roomId) {
		return chatRoomService.findRoomById(roomId);
	}
}
