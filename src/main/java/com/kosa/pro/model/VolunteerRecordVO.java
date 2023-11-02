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
public class VolunteerRecordVO implements GeneralModel {
	
	private static final long serialVersionUID = -337865601444804002L;
	
	private int volunSeq;
	private int memSeq;
	private int groupMemSeq;
	private int recruitSeq;
	private String volunStartDate;
	private String volunEndDate;
	private String timein;
	private String timeout;
	private int realAddtime;
	private String volunLocation;
	
	

}
