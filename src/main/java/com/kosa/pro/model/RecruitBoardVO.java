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
public class RecruitBoardVO implements GeneralModel {
	
	private static final long serialVersionUID = 5995424501649148152L;
	
	private int recruitSeq;
	private int groupMemSeq;
	private String groupName;
	private String volunRegion;
	private String volunStartDate;
	private String volunEndDate;
	private String recruitState;
	private String volunCode;
	private int volunTime;
	private String recruitStartDate;
	private String recruitEndDate;
	private int memCount;
	private String volunTarget;
	private String recruitTitle;
	private String recruitContent;
	private int viewCount;
	private String regDate;
	private String modDate;
	private String delYn;
	private String manager;
	private String email;
	private String phone;
	

}
