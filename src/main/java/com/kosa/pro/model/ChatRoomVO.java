package com.kosa.pro.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
									
//객체간 비교 가능
public class ChatRoomVO implements Comparable<ChatRoomVO>{
  
  private String chatRoomId; // 채팅방 ID
  private String roomName; // 채팅방 이름
  private Date createdRoomTime; // 방 생성 시간
  private char closed; // 방이 닫혔는지 여부 (Y/N)
  private Long recruitSeq;
  
  private VolunteerProceedVO volunteerProceedVO;
  private String recruitTitle;
  
  public static ChatRoomVO create(String roomName, VolunteerProceedVO volunteerProceed, String title)  {
	    String randomId = UUID.randomUUID().toString(); // String 타입의 랜덤 ID 생성
	    return new ChatRoomVO(randomId, roomName, null, 'N', null, volunteerProceed, title);
	}

	@Override
	public int compareTo(ChatRoomVO o) {
		if (o == null) return 1;
		return roomName.compareToIgnoreCase(o.roomName);
	}
	
  
  
}

