package com.kosa.pro.service.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kosa.pro.model.common.FileAttacheVO;
import com.kosa.pro.model.common.FileTokenVO;
import com.kosa.pro.model.common.FileUploadVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.utils.StringUtil;



@Service
public class FileUploadService extends BaseService {
	
	
	@Autowired
	private ServletContext application;

	//파일 저장
	public long fileUploadProcess(SearchVO search, MultipartFile file) throws Exception {
		
		String realFolder = StringUtil.getDateToString(File.separator + "YYYY" + File.separator + "MM" + File.separator + "dd");
		
		File realPath = new File(getConfig().getUploadPathPhysical() + getConfig().getUploadPathVirtual() + getConfig().getUploadPathEditor() + realFolder);
		
		if(!realPath.exists()) {
			realPath.mkdirs();
		}
		String fileNameReal = StringUtil.getRandomStringByUUID();
		File realFile = new File(realPath, fileNameReal);
		
		file.transferTo(realFile);

		FileAttacheVO fileAttacheVO = FileAttacheVO.of(search.getToken(), fileNameReal, file);
		getDAO().insert("fileattache.merge", fileAttacheVO);
		
		return fileAttacheVO.getFileSeq();
	}
	
//	public FileUploadVO findById(int file_id) {
//		return fileUploadDAO.findById(file_id);
//	}

	@Transactional
	public void updateUseStatus(Map<String, Object> param) {
		String token = (String) param.get("token");
		String editor = (String) param.get("editor");

		//파일 다운로드  URL을 구성한다
		String filesURL = application.getContextPath() + "/files/";
		
		//token 관련 첨부 파일 목록을 얻는다 
		List<FileAttacheVO> fileUploads = (List<FileAttacheVO>) getDAO().selectList("fileattache.getFileUploadList", token);
		List<FileAttacheVO> deleteImageList = fileUploads.stream().filter(
			fileUpload -> !editor.contains(filesURL + fileUpload.getFileSeq())
		).collect(Collectors.toList());

		//편집 중 삭제된 이미지를 삭제한다
		deleteImageList.stream().forEach(fileUpload -> new File(fileUpload.getFileName()).delete());
		
		
		//첨부 파일의 token사용 상태로 변경한다
		getDAO().update("filetoken.updateStatus", FileTokenVO.builder().token(token).status(1).build());
		//게시물 완료 시 이전에 편집 중 삭제한 목록을 삭제한다
		if (deleteImageList.size() != 0) {
			getDAO().delete("fileattache.deleteTemplateFile", Map.of("list", deleteImageList));
		}
	}

}