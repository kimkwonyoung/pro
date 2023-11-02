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
public class VolunteerTimeVO implements GeneralModel {
	
	private static final long serialVersionUID = -4784847271330187132L;
	
	private int memSeq;
	private int volunHeat;
	private int volunAddtime;
	private int volunNoshow;
	

}
