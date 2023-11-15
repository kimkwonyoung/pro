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
public class SupportVO implements GeneralModel {
	
	private static final long serialVersionUID = 4464602083930713731L;
	
	private int supportSeq;
	private String questionContent;
	private String regDate;
	private String state;
	private String member;
	private String memberType;

}
