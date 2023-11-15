package com.kosa.pro.model.search;



import org.springframework.web.multipart.MultipartFile;

import com.kosa.pro.model.common.SearchVO;

import lombok.Data;

/**
 * 후기 게시판 파라미터 모델
 */

@Data
public class ReviewSearchVO extends SearchVO {
	private static final long serialVersionUID = 8860661778683988628L;
	
	private String codeNumber;
	private int reviewSeq;
	private int recruitSeq;
	
	//유저정보
	private int memSeq;
	private String memAuth = "";
	
	//댓글 스크롤
	private int start;
	
	//글쓰기
	private MultipartFile file;
//	private String editor;
	private String title;
	private String[] arrCategory;
	
	
}
