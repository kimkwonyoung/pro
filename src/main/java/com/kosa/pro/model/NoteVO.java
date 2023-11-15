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
public class NoteVO implements GeneralModel {
	
	private static final long serialVersionUID = -6005074215974177477L;
	
	private int noteSeq;
	private int memSeq;	
	private String sender;
	private String receiver;
	private String title;
	private String content;
	private String sendTime;
	private String readYn;
	private String memType;

}
