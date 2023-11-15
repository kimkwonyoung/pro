package com.kosa.pro.controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.model.MasterCodeVO;
import com.kosa.pro.model.auth.ResponseVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.CodeSearchVO;
import com.kosa.pro.service.admin.AdminCodeService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminCodeController {

	@Autowired
	AdminCodeService _adminCodeService;
	
	@RequestMapping("/admincodemanagement")
	public String adminMangementMain(CodeSearchVO search, Model model) throws Exception {
		Map<String, Object> map = _adminCodeService.groupCode(search);
		model.addAttribute("groupCode", map.get("groupList"));
		
		return "admin/admincodemanagement";
	}
	@ResponseBody
	@PostMapping("/codegroup")
	public ResponseEntity<ResponseVO> codegroup(@RequestBody CodeSearchVO search) {
		
		log.info("코드 확인 = " + search.getGroupCode());
		
		ResponseVO responseVO = ResponseVO.builder()
				.httpStatus(HttpStatus.OK)
				.result(_adminCodeService.codeList(search))
				.build();
		
		return ResponseEntity.status(responseVO.getHttpStatus()).body(responseVO);
	}
	
	@ResponseBody
	@PostMapping("/deletecode")
	public ResponseEntity<ResponseVO> codedelete(@RequestBody MasterCodeVO code) {
		
		log.info("코드 확인 = " + code);
		
		_adminCodeService.deleteCode(code);
		
		ResponseVO responseVO = ResponseVO.builder()
				.httpStatus(HttpStatus.OK)
				.status(true)
				.build();
		
		return ResponseEntity.status(responseVO.getHttpStatus()).body(responseVO);
	}
	
	@ResponseBody
	@PostMapping("/codesave")
	public ResponseEntity<ResponseVO> codesave(@RequestBody MasterCodeVO code) {
		CodeSearchVO search = new CodeSearchVO();
		log.info("코드 확인 = " + code);
		
		_adminCodeService.saveCode(code);
		search.setGroupCode(code.getCodeGroup());
		ResponseVO responseVO = ResponseVO.builder()
				.httpStatus(HttpStatus.OK)
				.result(_adminCodeService.codeList(search))
				.status(true)
				.build();
		
		return ResponseEntity.status(responseVO.getHttpStatus()).body(responseVO);
	}
}
