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
public class AnswerVO implements GeneralModel {

	private static final long serialVersionUID = -9219822763894615310L;

	private int answerSeq;
	private int supportSeq;
	private String answerContent;
	private String regDate;
	
}
