package com.kosa.pro.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosa.pro.model.common.FileAttacheVO;
import com.kosa.pro.service.common.FileUploadService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class FileDownloadController {
	private final FileUploadService fileUploadService;

	@GetMapping("/files/{fileNo}")
	public void downloadFile(@PathVariable("fileNo") int fileNo, HttpServletResponse response) throws Exception{

		
		
		OutputStream out = response.getOutputStream();
		FileAttacheVO FileAttacheVO = fileUploadService.findById(fileNo);
		
		
		if (FileAttacheVO == null) {
			response.setStatus(404);
		} else {
			
			String originName = FileAttacheVO.getPhysicalName();
			originName = URLEncoder.encode(originName, "UTF-8");
			
			//다운로드 할 때 헤더 설정
			response.setHeader("Cache-Control", "no-cache");
			response.addHeader("Content-disposition", "attachment; fileName=" + originName);
			response.setContentLength(Integer.parseInt(FileAttacheVO.getFileSize()));
			response.setContentType(FileAttacheVO.getContentType());
			
			//파일을 바이너리로 바꿔서 담아 놓고 responseOutputStream에 담아서 보낸다.
			FileInputStream input = new FileInputStream(new File(FileAttacheVO.getPhysicalName()));
			
			//outputStream에 8k씩 전달
	        byte[] buffer = new byte[1024*8];
	        
	        while(true) {
	        	int count = input.read(buffer);
	        	if(count<0)break;
	        	out.write(buffer,0,count);
	        }
	        input.close();
	        out.close();
		}
	}	
}
