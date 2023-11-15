package com.kosa.pro.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.kosa.pro.model.ChatRoomVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.common.BaseService;

@Service
public class AdminChatRoomService extends BaseService {

	// 봉사신청 게시글에 따른 신청자들과 단체회원 채팅방 목록
	public Map<String, List<ChatRoomVO>> findAllRecruitChatRoom(MemberSearchVO search) throws Exception {

		Map<String, List<ChatRoomVO>> chatRoomMap = new HashMap<>();

		// MyBatis 쿼리 실행 이전에 로그 디버깅 추가
		System.out.println("채팅 서비스 - findAllRecruitChatRoom 호출");
		System.out.println("파라미터 search: " + search);

		List<ChatRoomVO> chatRoomList = (List<ChatRoomVO>) getDAO().selectBySearch("adminchat.findAllRecruitChatRoom",
				search, "totalCountChatroom");

		// MyBatis 쿼리 결과 확인
		System.out.println("채팅 서비스 - 조회 결과 chatRoomList: " + chatRoomList);

		// 결과 객체를 모델에 추가하기 전에 로그 디버깅 추가
		chatRoomMap.put("RecruitChatRoomList", chatRoomList);
		System.out.println("채팅 서비스 - chatRoomMap: " + chatRoomMap);

		return chatRoomMap;
	}

	// 특정 채팅 방의 정보를 가져오는 메서드
	public Map<String, List<ChatRoomVO>> findRoomById(String chatRoomId) {

		// MyBatis 쿼리 실행 이전에 로그 디버깅 추가
		System.out.println("채팅 서비스 - findRoomById 호출");

		Map<String, List<ChatRoomVO>> chatRoomMap = new HashMap<>();

		List<ChatRoomVO> chatRoomList = (List<ChatRoomVO>) getDAO().selectList("adminChat.findGetChatRoom", chatRoomId);

		chatRoomMap.put("ChatRoomInfo", chatRoomList);
		
		System.out.println("<서비스>채팅 특정 정보-chatRoomMap" + chatRoomMap);
		return chatRoomMap;
	}

	public void execute(String topic, String payload) {
  String [] cmdParams = StringUtils.split(topic, "/");
  System.out.println("topic = " + topic);
  System.out.println("payload = " + payload);
	
}
	
	
}
