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
public class VolunteerProceedVO implements GeneralModel {
	
	private static final long serialVersionUID = -2858513294136857815L;
	
	private int volunProceedSeq;
	private int recruitSeq;
	private int memSeq;
	private int groupMemSeq;
	private String state;
	private String rejectMessage;
	private String startDate;
	private String endDate;
	

}
