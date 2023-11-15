package com.kosa.pro.model;

import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewCommentVO implements GeneralModel {
	
	private static final long serialVersionUID = 6705684232532210421L;
	
	private int commentSeq;
	private int reviewSeq;
	private String comContent;
	private String writeId;
	private String regDate;
	private String modDate;
	private String delYn;
	private int memSeq;
	private String memAuth;
	
	private MemberVO member;

}
