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
public class FileUploadVO implements GeneralModel {
	private static final long serialVersionUID = 5497560216208457891L;
	
	private int fileNum; 
	private String token;
	private String originalFilename;
	private String realFilename;
	private String contentType;
	private long   size;
	
	private String refSeq; // 참조 순번
	private String tableName; // 참조 테이블 이름
	
	public static FileUploadVO of(String token, String real_filename, MultipartFile file, String refSeq, String tableName) {
		return FileUploadVO.builder()
				.token(token)
				.originalFilename(file.getOriginalFilename())
				.realFilename(real_filename)
				.contentType(file.getContentType())
				.size(file.getSize())
				.refSeq(refSeq)
				.tableName(tableName)
				.build();
	}
}
