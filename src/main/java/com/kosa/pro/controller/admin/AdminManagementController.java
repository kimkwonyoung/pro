package com.kosa.pro.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.model.GroupMemberVO;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.search.GroupMemberSearchVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.admin.AdminMemberService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminManagementController {

	@Autowired
	private AdminMemberService _memberService;
	
	//ppp삭제 jsp도 원래로 돌리기
	@RequestMapping("/adminmanagement")
	public String adminMangementMain(MemberSearchVO search, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>관리자 회원/단체 관리");
		Map<String, List<MemberVO>> map = _memberService.memberList(search);
		model.addAttribute("list", map.get("memberList"));
		model.addAttribute("search", search);
		
		return "admin/adminmanagement";
	}
	
    // 개인 회원 목록을 가져오는 AJAX 처리 메서드
    @GetMapping("/getIndividualMembers")
    @ResponseBody
    public List<MemberVO> getIndividualMembers(MemberSearchVO search) throws Exception {
        log.info("Fetching 개인 회원 AJAX call");
        Map<String, List<MemberVO>> map = _memberService.memberList(search);
        System.out.println("개인---------------------------" + map);
        return map.get("memberList");
    }

    // 단체 회원 목록을 가져오는 AJAX 처리 메서드
    @GetMapping("/getGroupMembers")
    @ResponseBody
    public List<GroupMemberVO> getGroupMembers(GroupMemberSearchVO search, Model model) throws Exception {
    	   log.info("Fetching 단체 AJAX call");
        Map<String, List<GroupMemberVO>> map = _memberService.groupMemberList(search);
        model.addAttribute("search", search);
        System.out.println(map + "뭐들어있음");
        return map.get("groupList");
    }
    
    // 회원 제제버튼 Ajax 처리 메서드
    @RequestMapping(value = "/adminBlockMember", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> adminBlockMember(@RequestBody MemberVO memberVO) {
    	Map<String, Object> response = _memberService.adminBlockMember(memberVO);
    	
    	if (response.containsKey("status") && response.get("status").equals("success")) {
    		log.info("회원 제재 성공: memSeq = " + memberVO.getMemSeq());
    		System.out.println(response + "Controller에서 if문 속 response ");
    	} else {
    		System.out.println(response + "Controller에서 if문 속 response 에러");
    		log.error("회원 제재 실패: memSeq 값이 없거나 처리 중 오류 발생");
    	}
    	
    	return response;
    }
    
		//ResponseEntity써야 요청에 다양한 대처가능하다고함 HTTP 응답을 다루는 것이 권장되는 방법
		//    @PostMapping("/adminBlockMember")  
		//    public ResponseEntity<Map<String, Object>> adminBlockMember(GroupMemberSearchVO search, @RequestBody Map<String, Object> requestBody) {
		//        Map<String, Object> response = _memberService.adminBlockMember((int) requestBody.get("memSeq"),search);
		//
		//        if (response.containsKey("status") && response.get("status").equals("success")) {
		//            log.info("회원 제재 성공: memSeq = " + requestBody.get("memSeq"));
		//            return ResponseEntity.ok(response);
		//        } else {
		//            log.error("회원 제재 실패: memSeq 값이 없거나 처리 중 오류 발생");
		//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		//        }
		//    }
    
    
    
}
	
	

