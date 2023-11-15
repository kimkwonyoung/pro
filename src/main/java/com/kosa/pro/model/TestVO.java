package com.kosa.pro.model;

import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TestVO implements GeneralModel {

	private static final long serialVersionUID = 1039969325268216347L;
	
	private int testNum;
	private String title;
	private String testName;
	

}
