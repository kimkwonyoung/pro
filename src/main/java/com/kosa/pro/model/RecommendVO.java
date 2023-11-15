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
public class RecommendVO implements GeneralModel {
	
	private static final long serialVersionUID = 5558757803325738454L;
	
	private int recomSeq;
	private int reviewSeq;
	private int memSeq;
	private String memAuth;

}
