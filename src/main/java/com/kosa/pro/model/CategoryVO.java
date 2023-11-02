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
public class CategoryVO implements GeneralModel {
	
	private static final long serialVersionUID = -5692358329727302011L;
	
	private int categorySeq;
	private int reviewSeq;
	private String codeNumber;

}
