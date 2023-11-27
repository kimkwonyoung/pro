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

import com.kosa.pro.model.ChatRoomVO;
import com.kosa.pro.service.test.ChatRoomService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/support")
public class ChatRoomController {

	@Autowired
	ChatRoomService chatRoomService;
	
	@GetMapping("/chat")
	public String supportChat(Model model) {
		return "test/testchat";
	}

//	// "roomList" 뷰 페이지를 반환하는 핸들러
//	@GetMapping("/roomList")
//	public String roomList(Model model) {
//		return "admin/roomList";
//	}
//	
//	
//	// 모든 채팅 방 목록을 JSON 형태로 반환하는 핸들러
//	@GetMapping("/FindAllRoom")
//	@ResponseBody
//	public List<ChatRoomVO> rooms() {
//		return chatRoomService.findAllRoom();
//	}
//
//	// 채팅 방 생성 요청을 처리하고 생성된 채팅 방을 JSON으로 반환하는 핸들러
//	@PostMapping("/CreateRoom")
//	@ResponseBody
//	public ChatRoomVO createRoom(@RequestParam String name) {
//		return chatRoomService.createChatRoom(name);
//	}
//
//	// 채팅 방 입장 페이지를 반환하는 핸들러
//	@GetMapping("/CreateRoom/enter/{roomId}")
//	public String roomEnter(Model model, @PathVariable String roomId) {
//		model.addAttribute("roomId", roomId);
//		return "/admin/chatRoom";
//	}
//
//	// 특정 채팅 방 정보를 JSON 형태로 반환하는 핸들러
//	@GetMapping("/SelectRoom/{roomId}")
//	@ResponseBody
//	public ChatRoomVO roomInfo(@PathVariable String roomId) {
//		return chatRoomService.findRoomById(roomId);
//	}
}