package com.kosa.pro.controller.chat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosa.pro.controller.admin.AdminChatController;
import com.kosa.pro.model.ChatRoomVO;
import com.kosa.pro.model.VolunteerProceedVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.UserChatRoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/userchat")
public class UserChatController {
	
	@Autowired
	private UserChatRoomService _userChatRoomService;

//	채팅방 단일 뷰 페이지를 반환하는 핸들러
	@GetMapping("/chatRoom")
	public String findmyChatRoom(@RequestParam(name = "memSeq") String memSeq, Model model) throws Exception {
		
		log.info("나의 채팅 목록 메인뷰");
		VolunteerProceedVO mychatInfo = _userChatRoomService.findmyChatRoom(memSeq);
		model.addAttribute("mychatinfo" , mychatInfo);
		model.addAttribute("memSeq" , memSeq);
		System.out.println("컨트롤러 ->> " + mychatInfo);
		
	return "chat/myChatRoomList";
}

	// 채팅 방 입장 페이지를 반환하는 핸들러
		@GetMapping("/room/enter")
		public String roomEnter(Model model) {
			return "/chat/myChatRoom";
		}
	
	
}

