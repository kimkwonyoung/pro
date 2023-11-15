package com.kosa.pro.websoket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kosa.pro.model.VolunteerRecordVO;

public class AttendanceWebSoketHandler extends TextWebSocketHandler {
	
	// WebSocketSession -> 클라이언트와 서버간의 전이중 통신을 담당하는 객체
	// JDBC의 Connection과 유사
	// 클라이언트의 최초 웹소켓 요청 시 생성됨
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());

	// 멤버번호나 아이디가 해당 게시글에서 '승인'을 받은 회원이 volunteer_record 테이블에 데이터가 추가되면
	// 누가 출석완료했는지 전달함.
	
	public void attendanceY(VolunteerRecordVO record) throws Exception {
		Iterator<WebSocketSession> iterator = sessions.iterator();
		
		while(iterator.hasNext()) {
			WebSocketSession session = iterator.next();
			try {
				// 클라이언트에게 전송할 메시지를 TextMessage 객체로 만듦.
				TextMessage message = new TextMessage(record.getMemSeq()+":"+record.getTimein());
				// TextMessage를 클라이언트에게 전송한다.
				session.sendMessage(message);
			} catch (Exception e) {
				// 전송 중 에러가 발생하는 해당 클라이언트와 통신을 담당하는 WebSocketSession 객체를 삭제함.
				iterator.remove();
			} // try-catch
			
		} // while
		
	} // attendanceY
	
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
	}
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 연결 요청이 접수되면 해당 클라이언트와 통신을 담당하는 WebSocketSession 객체가 전달됨
		// WebSocketSession 객체를 Set에 담아둔다.
		sessions.add(session);
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 클라이언트와 연결이 해제되면 통신을 담당하는 객체를 HashSet에서 제거함.
		sessions.remove(session);
	}
	
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// 클라이언트와 데이터 송수신 중 에러가 발생해도 해당 클라이언트와 통신을 담당하는 객체를
		// HashSet에서 제거함.
		sessions.remove(session);
	}
	
	
	
	
} // end class
