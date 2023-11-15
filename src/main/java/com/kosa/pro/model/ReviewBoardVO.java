package com.kosa.pro.model;

import java.sql.Clob;

import com.kosa.pro.model.common.FileAttacheVO;
import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewBoardVO implements GeneralModel {
	
	private static final long serialVersionUID = 482357015873878741L;
	
	private int reviewSeq;
	private int recruitSeq;
	private String reviewTitle;
	private String reviewContent;
	private String writeId;
	private String regDate;
	private String modDate;
	private int recomCount;
	private int viewCount;
	private String delYn;
	private int imageSeq;
	private int memSeq;
	
	private MemberVO member;
	
	public static ReviewBoardVO of(int recruitSeq, String reviewTitle, String reviewContent, String writeId, int imageSeq, int memSeq) {
		return ReviewBoardVO.builder()
				.recruitSeq(recruitSeq)
				.reviewTitle(reviewTitle)
				.reviewContent(reviewContent)
				.writeId(writeId)
				.imageSeq(imageSeq)
				.memSeq(memSeq)
				.build();
	}
	

}
