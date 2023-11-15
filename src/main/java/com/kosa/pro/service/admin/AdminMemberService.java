package com.kosa.pro.service.admin;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kosa.pro.model.GroupMemberVO;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.search.GroupMemberSearchVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.common.BaseService;

/**
 * 회원관리 -kmj
 */

@Service
public class AdminMemberService extends BaseService {

	// 회원리스트
	public Map<String, List<MemberVO>> memberList(MemberSearchVO search) throws Exception {

		Map<String, List<MemberVO>> map = new HashMap<>();
		map.put("memberList", (List<MemberVO>) getDAO().selectBySearch("adminmember.selectMemberWithVolunteerTimeList",
				search, "totalCount"));
		return map;
	}

	// 단체리스트
	public Map<String, List<GroupMemberVO>> groupMemberList(GroupMemberSearchVO search) throws Exception {
		
		// 단체 회원 리스트를 가져오는 쿼리 실행	
		System.out.println("단체 리스트 ajax 테스트");
		
		Map<String, List<GroupMemberVO>> groupmap = new HashMap<>();
		
		groupmap.put("groupList", (List<GroupMemberVO>) getDAO().selectBySearch("adminmember.selectgroupmemberwithgradelist",
				search, "totalCount"));
		
		System.out.println("서비스 groupList 이거");
	
		return groupmap;
	}

	//제재 버튼 클릭시 제제함으로 변경되는 메소드
	public Map<String, Object> adminBlockMember(MemberVO memberVO) {
		
		System.out.println("제재 버튼 ajax 서비스");
		System.out.println("뭐들어있어 : ------"+memberVO.toString()+ memberVO);
		
		Map<String, Object> MemberBlock = new HashMap<>();
		int updateResult = getDAO().update("adminmember.AdminBlockMember", memberVO);
		MemberBlock.put("status", (updateResult > 0) ? "success" : "error");
		
		if (updateResult > 0) {
	        MemberBlock.put("message", "회원에게 제재를 하였습니다");
	    } else {
	        MemberBlock.put("message", "회원에게 제재 실패");
	    }
	    
	    return MemberBlock;
	}
	
	
	
		// 리스트를 돌면서 특정 온도,평점이 이하 점수가 되면 쪽지 발송되게 끔!
//	 	@Scheduled(fixedRate = 5000) // 5초마다 실행
	 	@Scheduled(fixedRate = 43200000) // 12시간마다 실행
	    public void sendMessagesToUsers() {
	        System.out.println("쪽지발송");
	 		// 로직 구현
	        // 쪽지를 발송하는 로직을 구현합니다.
	    }

}
