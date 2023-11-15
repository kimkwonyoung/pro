package com.kosa.pro.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.config.auth.PrincipalDetails;
import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.VolunteerProceedVO;
import com.kosa.pro.model.VolunteeringVO;
import com.kosa.pro.model.auth.LoginMember;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.service.MypageGroupService;
import com.kosa.pro.service.RecruitBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager")
public class MypageGroupController extends PrtController {

	@Autowired
	private MypageGroupService _mypageGroupService;
	
	@Autowired
	private RecruitBoardService _recruitBoardService;


//	5마이페이지 메인
//	끝)봉사활동 신청 글 작성
//	1봉사활동 신청 목록/승인 및 거절
//	2진행중인 봉사
//	4봉사활동 후기글
//	3캘린더 확인
//	6개인정보 및 프로필 수정
	
	// ============================ 마이페이지 ============================
	
	// 1. 마이 페이지(메인)
	@GetMapping("/main")
	public String main(@RequestParam int groupSeq, BoardSearchVO search, Model model, Authentication authentication) throws Exception {
		super.setPageSubTitle("봉사활동 등록 페이지", model);

		
		/*GroupMemberVO member, 
		 * Map<String, List<GroupMemberVO>> map1 = _mypageGroupService.memberVO(member);
		 * 
		 * model.addAttribute("main", map1.get("member"));
		 */
		/* model.addAttribute("member", authentication.); */
		
		if (authentication != null) {
			PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
			if (principalDetails != null) {
				LoginMember loginMember = principalDetails.getUser();
				model.addAttribute("loginMember", loginMember);
			}
		}
		
		return "mypage/group/mypage_main";
		
	}
	
	
	// 2. 봉사활동 신청 글 작성 -> recruitGroupContoller에 작성
	
	
	
	/*
	 * @GetMapping("/list") public String recruitList(BoardSearchVO search, Model
	 * model) throws Exception { super.setPageSubTitle("봉사신청 목록 페이지", model); //
	 * log.info(">>>>>>>>>>>>>>서치 = " + search.); search.setRecordCount(5);
	 * Map<String, List<RecruitBoardVO>> map =
	 * _recruitBoardService.recruitList(search); model.addAttribute("list",
	 * map.get("recruitList")); model.addAttribute("search", search);
	 * 
	 * return "recruit/recruit_list";
	 * 
	 * }
	 */
	
	// 3. 신청 목록/승인 및 거절
	@GetMapping("/updateState")
	public String updateState(@RequestParam int groupSeq, VolunteerProceedVO proceed, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 신청목록관리 승인/거절 페이지", model);
		
		proceed.setGroupMemSeq(groupSeq);
		
		Map<String, List<VolunteerProceedVO>> map1 = _mypageGroupService.volunteerProceedList(proceed);
		Map<String, List<VolunteerProceedVO>> map2 = _mypageGroupService.approve(proceed);
		Map<String, List<VolunteerProceedVO>> map3 = _mypageGroupService.reject(proceed);
		
		model.addAttribute("state", map1.get("state")); 
		model.addAttribute("approve", map2.get("approve")); 
		model.addAttribute("reject", map3.get("reject")); 

		return "mypage/group/mypage_recruit_list";
		
	}
	
	
	// 3-2. 승인처리하기
	@ResponseBody
	@PostMapping("/approve")
	public Map<String, Object> approve (@RequestBody VolunteerProceedVO vpvo, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>단체 신청 승인 컨트롤러");
		
		
		Map<String, Object> result = new HashMap<>();
		int status = _mypageGroupService.updateApprove(vpvo);
		
    	if(status > 0) {
    		result.put("status", true);
    		result.put("message", "봉사신청 '승인' 처리 되었습니다.");
    		result.put("approve", _mypageGroupService.approve(vpvo));
    	} else {
    		result.put("status", false);
    		result.put("message", "오류가 발생했습니다. 다시 시도해주세요.");
    	}
    	
//    	똑같나~
		return result;
	} //approve
	
	// 3-2. 거절하기
	@ResponseBody
	@PostMapping("/reject")
	public Map<String, Object> reject (@RequestBody VolunteerProceedVO vpvo, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>단체 신청 거절 컨트롤러");
		
		Map<String, Object> result = new HashMap<>();
		int status = _mypageGroupService.updateReject(vpvo);

		
    	if(status > 0) {
    		result.put("status", true);
    		result.put("message", "봉사신청 '거절' 처리 되었습니다.");
    		result.put("reject", _mypageGroupService.reject(vpvo));
    	} else {
    		result.put("status", false);
    		result.put("message", "오류가 발생했습니다. 다시 시도해주세요.");
    	}
		
		return result;
	} //reject
	
	
	
	
	
	// 4. 진행 중인 봉사 =================================================================================
	
	// 4-1. 진행 중인 봉사 목록(당일, 일주일 내)
	@GetMapping("/volunteeringList")
	public String volunteeringList(@RequestParam int groupSeq, RecruitBoardVO vo, BoardSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("진행 중인 봉사 목록 페이지", model);
		log.info(">>>>>>>>>>>>>>진행 중인 봉사 목록 페이지");
		
		try {
			vo.setGroupMemSeq(groupSeq);
			
			// 4-1-1. 당일 봉사활동 목록
			Map<String, List<RecruitBoardVO>> map1 = _mypageGroupService.selectVolunteeringList(vo);
			model.addAttribute("today", map1.get("today")); 
			
			System.out.println("map1 : " + map1);
			
			System.out.println("전달잘됐나1");
			
			// 4-1-2. 일주일 이내 봉사활동 목록
			Map<String, List<RecruitBoardVO>> map2 = _mypageGroupService.selectVolunteeringListWithinAWeek(vo);
			model.addAttribute("withinAWeek", map2.get("withinAWeek"));
			
			System.out.println("map2 : " + map2);
			

			System.out.println("전달잘됐나2");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "mypage/group/mypage_volunteering_list";
	}
	
	
	// 4-3. 진행 중인 봉사 상세페이지
	@GetMapping("/volunteering")
	public String working(RecruitBoardVO recruit, VolunteerProceedVO vo, Model model) throws Exception {
	    super.setPageSubTitle("진행 중인 봉사 상세 페이지", model);
	    log.info(">>>>>>>>>>>>>>진행 중인 봉사 상세 페이지");

		/* vo.setGroupMemSeq(groupSeq); */
	    
	    try {
	    	
	    	Map<String, List<VolunteerProceedVO>> map =  _mypageGroupService.volunteering(vo);

	    	model.addAttribute("recruit", _recruitBoardService.recruitDetail(recruit));
			model.addAttribute("volunteer", map.get("volunteer"));
			
	        System.out.println("전달잘됐나");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return "mypage/group/mypage_volunteering";
	}

	
	
	// 5. 봉사활동 후기 글 =================================================================================
	
	
	// 5. 봉사활동 후기 글
	@GetMapping("/review")
	public String review(@RequestParam int groupSeq, BoardSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 후기 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 봉사활동 후기 글");
		
		/*
		 * vo.setGroupMemSeq(groupSeq);
		 */
		
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/mypage_review_list";
		
	}
	
	// 6. 캘린더 관리
	@GetMapping("/calendar")
	public String calender(@RequestParam int groupSeq, BoardSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("캘린더 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 캘린더");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/mypage_calendar";
		
	}
	
	// 7. 개인 정보 및 프로필 수정
	@GetMapping("/profile")
	public String profile(@RequestParam int groupSeq,BoardSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("단체 개인 정보 및 프로필 수정 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 개인 정보 및 프로필 수정");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/mypage_profile";
		
	}
	
	
} // end class
