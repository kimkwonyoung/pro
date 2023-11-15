package com.kosa.pro.controller.review;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosa.pro.config.auth.PrincipalDetails;
import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.MasterCodeVO;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.RecommendVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.ReviewCommentVO;
import com.kosa.pro.model.auth.LoginMember;
import com.kosa.pro.model.auth.ResponseVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.ReviewSearchVO;
import com.kosa.pro.service.ReviewBoardService;
import com.kosa.pro.service.common.FileTokenService;
import com.kosa.pro.service.common.FileUploadService;
import com.kosa.pro.utils.StringUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review/")
public class ReviewController extends PrtController {
	
	@Autowired
	private ReviewBoardService _reviewBoardService;
	@Autowired
	private FileTokenService _fileFileTokenService;
	@Autowired
	private FileUploadService _fileUploadService;
	
	
	@RequestMapping("list")
	public String reviewList(ReviewSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("후기게시판 목록", model);
		log.info(">>>>>>>>>>>>>>서치 = " + search.getCodeNumber());
		search.setRecordCount(5);
		search.setGroupCode("0001");
		if (!StringUtil.isEmpty(search.getCodeNumber()))
			model.addAttribute("categoryName", _reviewBoardService.codeName(search));
		
		Map<String, Object> map = _reviewBoardService.reviewList(search);
		model.addAttribute("list", map.get("reviewList"));
		model.addAttribute("polist", map.get("popularList"));
		model.addAttribute("categoryList", map.get("categoryList"));
		model.addAttribute("search", search);
		
		return "review/review_list";
	}
	
	@RequestMapping("info")
	public String reviewInfo(ReviewSearchVO search, Model model, Authentication authentication) {
		super.setPageSubTitle("후기 상세 보기", model);
		//조회수 증가
		_reviewBoardService.reviewViewCount(search);
		
		
		//로그인 유저 데이터 구성
		if (authentication != null) {
			PrincipalDetails principal = (PrincipalDetails) authentication.getPrincipal();
			search.setMemAuth(principal.getUser().getLoginAuth());
			search.setMemSeq(principal.getUser().getMemSeq());
		}
		
		log.info("서치데이터 = " + search);
		
		Map<String, Object> map = _reviewBoardService.reviewInfo(search);
		log.info("글 상세보기 서치 데이터 = " + search.getRecordCount() + " //////// " + search.getCpage());
		model.addAttribute("info", map.get("reviewInfo"));
		model.addAttribute("polist", map.get("popularList"));
		model.addAttribute("categoryList", map.get("categoryList"));
		model.addAttribute("categoryName", map.get("categoryName"));
		model.addAttribute("commentList", map.get("commentList"));
		model.addAttribute("commentCount", map.get("commentCount"));
		model.addAttribute("recommendInt", map.get("recommend"));
		model.addAttribute("recruit", map.get("recruit"));
		model.addAttribute("search", search);
		
		log.info("이미추천한수 카운트 = " + map.get("recommend"));
		
		return "review/review_info";
	}
	
	@RequestMapping("writeForm")
	public String reviewWriteForm(ReviewSearchVO search, Model model) {
		super.setPageSubTitle("후기 글쓰기", model);
		final String token = _fileFileTokenService.getToken();
		log.debug("token = ", token);
		search.setTableName("review");
		Map<String, Object> map = _reviewBoardService.reviewWriteForm(search);
		
		model.addAttribute("recruit", map.get("recruit"));
		model.addAttribute("categoryList", map.get("categoryList"));
		model.addAttribute("search", search);
		model.addAttribute("token", token);
		return "review/review_write";
	}
	
	
	@PostMapping(value = "write")
	@ResponseBody
	public Map<String, Object> reviewWrite(@RequestPart("editor") String editorValue, ReviewSearchVO search, Authentication authentication) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("token", search.getToken());
		map.put("editor", editorValue);
		
		log.info(">>>>>>>>후기게시판서치데이터 = " + search);
		

		//에디터의 이미지파일 처리
		_fileUploadService.updateUseStatus(map);
		PrincipalDetails principal = (PrincipalDetails) authentication.getPrincipal();
		log.info("principal 데이터 확인 " + principal);
		
		//로그인한 유저의 데이터 가져와서 게시판에 SEQ 추가(아이디로 안하고 seq로 넣어서 필요한 로직 - 고려해야함 )
		MemberVO mem = _reviewBoardService.reviewLoginUser(principal.getUser().getLoginId());
		
		log.info("회원 데이터 체크 = " + mem);
		
		//insert 데이터 구성(봉사게시판번호, 글제목, 글내용, 작성자, 이미지파일번호, 회원번호)
		ReviewBoardVO reviewBoard = ReviewBoardVO.of(search.getRecruitSeq(), search.getTitle(), editorValue, principal.getUser().getLoginName(), 0, mem.getMemSeq());
		
		log.info("구성된 리뷰보드 = " + reviewBoard);
		int refSeq = _reviewBoardService.reviewInsert(reviewBoard);
		
		search.setRefSeq(String.valueOf(refSeq));
		//썸네일 이미지 업로드
		int imageSeq = (int) _fileUploadService.fileUploadProcess(search, search.getFile());
		
		//게시판에 이미지 번호 업데이트
		log.info("파일업로드된 이미지 번호 >>>>" + imageSeq);
		log.info("글 등록된 게시판 번호 >>>>> " + refSeq);
		reviewBoard.setImageSeq(imageSeq);
		reviewBoard.setReviewSeq(refSeq);
		
		//등록된 게시판에 썸네일 이미지 파일 번호 업데이트
		_reviewBoardService.reviewInsert(reviewBoard);
		
		//등록된 게시판의 글 번호를 카테고리에 저장 하기 위해 구성
		search.setReviewSeq(refSeq);
		
		//카테고리 등록
		_reviewBoardService.reviewCategorySave(search);
		
		Map<String, Object> result = new HashMap<>();
		result.put("uploaded", true); // 업로드 완료

		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "scroll")
	public ResponseEntity<ResponseVO> commentScroll(@RequestBody ReviewSearchVO search) throws Exception {
		
		search.setRecordCount(5);
		search.setCpage(search.getStart());
		List<ReviewCommentVO> comment = _reviewBoardService.commentScrollList(search);
		log.info("댓글 스크롤 리스트 = " + comment);
		log.info("비동개 댓글 서치 데이터 = " + search.getRecordCount() + " //////// " + search.getCpage());
		//.httpStatus(HttpStatus.INTERNAL_SERVER_ERROR)
		ResponseVO responseVO = ResponseVO.builder()
				.httpStatus(HttpStatus.OK)
				.result(comment)
				.build();
		
		
		return ResponseEntity.status(responseVO.getHttpStatus()).body(responseVO);
	}
	@ResponseBody
	@PostMapping(value = "comment")
	public ResponseEntity<ResponseVO> commentWrite(@RequestBody ReviewCommentVO comment, Authentication authentication) throws Exception {
		//로그인 유저 데이터
		PrincipalDetails principal = (PrincipalDetails) authentication.getPrincipal();
		
		log.info("서치데이터 뭔데 = " + comment.getReviewSeq());
		
		comment.setWriteId(principal.getUser().getLoginName());
		comment.setMemAuth(principal.getUser().getLoginAuth());
		comment.setMemSeq(principal.getUser().getMemSeq());
		//이쪽 오류 잡아야함
		log.info("합친 댓글 데이터 = " + comment);
		
		Map<String, Object> map = _reviewBoardService.commentSave(comment);
		List<ReviewCommentVO> result = new ArrayList<>();
		result.add((ReviewCommentVO) map.get("comment"));
		
		ResponseVO responseVO = ResponseVO.builder()
				.httpStatus(HttpStatus.OK)
				.result(result)
				.count((int) map.get("count"))
				.build();
		
		return ResponseEntity.status(responseVO.getHttpStatus()).body(responseVO);
	}
	
	@ResponseBody
	@PostMapping("recommend")
	public ResponseEntity<ResponseVO> recommend(@RequestBody RecommendVO recommend) throws Exception {
		log.info("추천수 ajax 진입 확인 = " + recommend);
		
		int recommendCount = _reviewBoardService.reviewRecommendFlag(recommend);
		
		String msg = "추천 취소!";
		boolean status = false;
		
		if (recommendCount > 0) {
			//추천수 감소
			_reviewBoardService.recommendUpdate(recommend);
		} else {
			//추천수 증가
			_reviewBoardService.recommendProcess(recommend);
			msg = "추천 완료!";
			status = true;
		}
		
		int recommendTotalCount = _reviewBoardService.reviewRecommendCount(recommend.getReviewSeq());
		
		ResponseVO responseVO = ResponseVO.builder()
				.httpStatus(HttpStatus.OK)
				.count(recommendTotalCount)
				.status(status)
				.message(msg)
				.build();
		
		
		return ResponseEntity.status(responseVO.getHttpStatus()).body(responseVO);
	}
	
	
//	@ResponseBody
//	@PostMapping("")
//	public ResponseEntity<ResponseVO> test(@RequestBody ReviewSearchVO search) throws Exception {
//		//.httpStatus(HttpStatus.INTERNAL_SERVER_ERROR)
//		ResponseVO responseVO = ResponseVO.builder()
//				.httpStatus(HttpStatus.OK)
//				.message("")
//				.build();
//		
//		
//		return ResponseEntity.status(responseVO.getHttpStatus()).body(responseVO);
//	}

}
