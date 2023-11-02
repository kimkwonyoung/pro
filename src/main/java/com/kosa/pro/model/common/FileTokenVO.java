package com.kosa.pro.model.common;

import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FileTokenVO implements GeneralModel {
	
	private static final long serialVersionUID = -6377537556130809059L;
	
	private String token;
	private int    status;
	
}
