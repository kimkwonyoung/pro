package com.kosa.pro.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.service.common.FileTokenService;
import com.kosa.pro.service.common.FileUploadService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class CKEditorController extends PrtController {
	private final FileTokenService fileTokenService;
	private final FileUploadService fileUploadService;

	@GetMapping(value={"/ckeditorForm"})
	public String ckeditorForm(Model model) throws IOException {
		final String token = fileTokenService.getToken();
		log.debug("token = ", token);
		model.addAttribute("token", token);
		return "test/ckeditorForm";
	}

	@PostMapping(value = "/imageUpload")
	@ResponseBody
	public Map<String, Object> image(MultipartHttpServletRequest request) throws Exception {
    
		// ckeditor는 이미지 업로드 후 이미지 표시하기 위해 uploaded 와 url을 json 형식으로 받아야 함
		// ckeditor 에서 파일을 보낼 때 upload : [파일] 형식으로 해서 넘어옴, upload라는 키 이용하여 파일을 저장 한다
		MultipartFile file = request.getFile("upload");
		String token = request.getParameter("token");
		SearchVO search = new SearchVO();
		search.setToken(token);
		System.out.println("token = " + token);

		//이미지 첨부 파일을 저장한다 
		long file_id = fileUploadService.fileUploadProcess(search, file);
		

		// 이미지를 현재 경로와 연관된 파일에 저장하기 위해 현재 경로를 알아냄
		String uploadPath = request.getServletContext().getContextPath() + "/files/" + file_id;
		log.info("업로드경로 >>>>>>>>>> " + uploadPath);
		Map<String, Object> result = new HashMap<>();
		result.put("uploaded", true); // 업로드 완료
		result.put("url", uploadPath); // 업로드 파일의 경로

		return result;
	}
	
	@PostMapping(value = "/ckeditorWrite")
	@ResponseBody
	public Map<String, Object> ckeditorWrite(@RequestBody Map<String, Object> param) throws Exception {
		
		System.out.println(param);
		

		fileUploadService.updateUseStatus(param);
		
		Map<String, Object> result = new HashMap<>();
		result.put("uploaded", true); // 업로드 완료

		return result;
	}
	
	
}
