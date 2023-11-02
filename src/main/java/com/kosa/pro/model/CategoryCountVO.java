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
public class CategoryCountVO implements GeneralModel {
	
	private static final long serialVersionUID = -7824704516597753040L;
	
	private int reviewSeq;
	private int categorySeq;
	private int categoryCount;

}
