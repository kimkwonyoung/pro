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
public class MasterCodeVO implements GeneralModel {

	private static final long serialVersionUID = 5601508389671979656L;
	
	private String codeGroup;
	private String codeMember;
	private String codeName;
	private String codeDetail;
	private String codeYn;
	

}
