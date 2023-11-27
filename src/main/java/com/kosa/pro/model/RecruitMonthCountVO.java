package com.kosa.pro.model;

import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
public class RecruitMonthCountVO implements GeneralModel {

	    private String month; //  차트 월
	    private int totalRecruits; // 차트 봉사 활동 수 

	}
