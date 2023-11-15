package com.kosa.pro.controller;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.kosa.pro.config.auth.PrincipalDetails;
import com.kosa.pro.model.auth.LoginMember;
import com.kosa.pro.utils.GlobalProperty;


/**
 * 기본 super controller : 컨트롤러 상속용 부모 컨트롤러
 * 
 * @author kky
 *
 */
@Controller
public class PrtController {
	
	private static final Logger logger = LoggerFactory.getLogger(PrtController.class);
	
	@Resource
	GlobalProperty configBean;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ApplicationContext applicationContext;
	
	@Autowired
	HttpSession session;
	
	
	public GlobalProperty getConfig()
	{
		return this.configBean;
	}
	
	public ServletContext getServletContext() {
		return this.servletContext;
	}
	
	public ApplicationContext getApplicationContext() {
		return this.applicationContext;
	}
	
	public HttpSession getSession() {
		return this.session;
	}
	
//	/**
//	 * 관리자 세션 - 관리자 모델로 형변환하여 사용
//	 * 			- 관리자 모델이 정의되면 해당 모델로 변환 (스프링 시큐리티로 인해 사용 X)
//	 * @return
//	 */
//	public MemberVO getAdminSession() {
//		return (MemberVO) this.session.getAttribute(this.getConfig().getSessionNameForAdmin());
//	}
	
//	/**
//	 * 사용자 세션 - 사용자 모델로 형변환하여 사용
//	 * 			- 사용자 모델이 정의되면 해당 모델로 변환 (스프링 시큐리티로 인해 사용 X)
//	 * @return
//	 */
//	 public MemberInfoVO getUserSession() {
//		 return (MemberInfoVO)this.session.getAttribute(this.getConfig().getSessionNameForUser());
//	}
	
	
	/**
	 * 페이지 서브 타이틀 추가  
	 *  - 웹 접근성 요소 중 하나 : 페이지별 부 제목 표시 처리용
	 *  - jsp html 선언부 title 엘리먼트에 ${pageTitle } 추가 후 사용 (globals.properties : site.pageTitle 참조)
	 * @param title
	 * @param model
	 */
	public void setPageSubTitle(String title, Model model) {
		model.addAttribute(this.getConfig().getPageTitle(), title);
	}
	
	/**
	 * BindingResult객체를 global Exception으로 변경하여 공통 Error페이지로 출력할 수 있도록 합니다.
	 * 부트 사용 x
	 * @param result
	 * @param model
	 * @return
	 */
//	public String setBindingResult(BindingResult result, Model model) {
//		if (result.getAllErrors().size() > 0) {
//			StringBuffer sb = new StringBuffer();
//			for (Object e : result.getAllErrors()) {
//				sb.append(((ObjectError)e).getObjectName() + " - " + ((ObjectError)e).getDefaultMessage() + "<br />");
//			}
//			
//			Exception ex = new Exception("[BindingResult Exception] 올바르지 않은 파라미터 입력 : " + sb.toString());
//			//Exception ex = new Exception("[BindingResult Exception] 올바르지 않은 파라미터 입력");
//			
//			logger.error(ex.getMessage(), ex);
//			
//			model.addAttribute("exception", ex);
//		}
//		
//		return getConfig().getViewError();
//	}
	
	
	/**
	 * 모델에 reqURI 속성값으로  request.getRequestURI 값을 매핑합니다.
	 * 	- 서브 페이지에서 액션 URL을 필요로 할 때 사용할 수 있습니다.
	 * @param model
	 * @param request
	 * @return
	 */
	public void setRequestURItoModel(Model model, HttpServletRequest request) {
		model.addAttribute("reqURI", request.getRequestURI());
	}
	
	
}
