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
public class GradeVO implements GeneralModel {
	
	private static final long serialVersionUID = -8780307055634424849L;
	
	private int gradeSeq;
	private int groupMemSeq;
	private int gradeCount;
	private int gradeAdd;
	private int grade;

}
