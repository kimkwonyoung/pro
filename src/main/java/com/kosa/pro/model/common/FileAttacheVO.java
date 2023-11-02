package com.kosa.pro.model.common;

import org.springframework.web.multipart.MultipartFile;

import com.kosa.pro.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FileAttacheVO implements GeneralModel {

	private static final long serialVersionUID = -3926053539114630393L;
	
	private long fileSeq;
	private String tableName;
	private String refSeq;
	private String fileName;
	private String physicalName;
	private String contentType;
	private String fileSize;
	private String fileType;
	private String regDate;
	private String fileToken;
	
	public static FileAttacheVO of(String token, String fileName, MultipartFile file) {
		return FileAttacheVO.builder()
				.fileToken(token)
				.physicalName(file.getOriginalFilename())
				.fileName(fileName)
				.contentType(file.getContentType())
				.fileSize(String.valueOf(file.getSize()))
				.build();
	}

}
