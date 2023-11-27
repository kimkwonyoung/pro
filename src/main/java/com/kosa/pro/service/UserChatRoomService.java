package com.kosa.pro.service;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.ChatRoomVO;
import com.kosa.pro.model.VolunteerProceedVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.common.BaseService;

@Service
public class UserChatRoomService extends BaseService{

	public VolunteerProceedVO findmyChatRoom(String memSeq) {
		
		System.out.println("회원채팅서비스");
		
		VolunteerProceedVO chatRoomInfo = (VolunteerProceedVO) getDAO().selectOne("adminchat.findMyChatRoom", memSeq);
		return chatRoomInfo;
	}

	
	
}
