package com.kosa.pro.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosa.pro.model.common.AlertModel;
import com.kosa.pro.model.common.SearchVO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class CustomErrorController extends PrtController implements ErrorController {
	
	@RequestMapping("/error")
	public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        System.out.println("상태코드 = " + status.toString());
        String url = "";
        if (status != null) {
            int statusCode = Integer.parseInt(status.toString());
            
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
            	url = "/404";
            } else if (statusCode == HttpStatus.FORBIDDEN.value()) {
            	url = "/403";
            } else if (statusCode == HttpStatus.BAD_REQUEST.value()) {
            	url = "/400";
            } else if (statusCode == HttpStatus.METHOD_NOT_ALLOWED.value()) {
            	url = "/405";
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
            	url = "/500";
            } else if (statusCode == HttpStatus.SERVICE_UNAVAILABLE.value()) {
            	url = "/503";
            }
        }
        return "redirect:" + url + "?statusCode=" + status.toString();
	}
	
	@RequestMapping("/400")
	public String error400(Model model, @RequestParam(required = false) String statusCode) {
		model.addAttribute("messageEng", "Bad Request");
		model.addAttribute("message", "잘못된 요청입니다.");
		model.addAttribute("statusCode", statusCode);
		return getConfig().getViewError();
	}
	
	@RequestMapping("/403")
	public String error403(Model model, @RequestParam(required = false) String statusCode) {
		model.addAttribute("messageEng", "Forbidden");
		model.addAttribute("message", "접근할 수 없는 요청입니다.");
		model.addAttribute("statusCode", statusCode);
		return getConfig().getViewError();
	}
	
	@RequestMapping("/404")
	public String error404(Model model, @RequestParam(required = false) String statusCode) {
		model.addAttribute("messageEng", "Not Found");
		model.addAttribute("message", "잘못된 요청입니다.");
		model.addAttribute("statusCode", statusCode);
		return getConfig().getViewError();
	}
	
	@RequestMapping("/405")
	public String error405(Model model, @RequestParam(required = false) String statusCode) {
		model.addAttribute("messageEng", "Method Not Allowed");
		model.addAttribute("message", "요청된 메서드는 허용되지 않습니다.");
		model.addAttribute("statusCode", statusCode);
		return getConfig().getViewError();
	}
	
	@RequestMapping("/500")
	public String error500(Model model, @RequestParam(required = false) String statusCode) {
		model.addAttribute("messageEng", "Internal Server Error");
		model.addAttribute("message", "요청된 메서드는 허용되지 않습니다.");
		model.addAttribute("statusCode", statusCode);
		return getConfig().getViewError();
	}
	
	@RequestMapping("/503")
	public String error503(Model model, @RequestParam(required = false) String statusCode) {
		model.addAttribute("messageEng", "Service Temporarily Unavailable");
		model.addAttribute("message", "서버를 일시적으로 사용할 수 없습니다.");
		model.addAttribute("statusCode", statusCode);
		return getConfig().getViewError();
	}

}
