package com.kosa.pro.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.model.ChatRoomVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.admin.AdminChatRoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminChatController {

	@Autowired
	private AdminChatRoomService adminChatRoomService;

	// "채팅jsp" 뷰 페이지를 반환하는 핸들러
	@GetMapping("/adminchat")
	public String findAllRecruitChatRoom(MemberSearchVO search, Model model) throws Exception {
	log.info("----------채팅 메인 뷰");
	Map<String, List<ChatRoomVO>> map = adminChatRoomService.findAllRecruitChatRoom(search);
	model.addAttribute("chatlist", map.get("RecruitChatRoomList"));
	model.addAttribute("search", search);
	System.out.println("-- 채팅 컨트롤러 ->> " + map);
	//목록 가져오지말고 내가 승인된 한건 봉사id	
	return "admin/adminchat";
}

	
	//특정채팅방의 메시지내역 반환.
	@GetMapping("/admin/chatRoom/{chatRoomId}")
	@ResponseBody
	public Map<String, List<ChatRoomVO>> roomInfo(@PathVariable String chatRoomId) {
		
		return adminChatRoomService.findRoomById(chatRoomId);
		
	}
	

}
