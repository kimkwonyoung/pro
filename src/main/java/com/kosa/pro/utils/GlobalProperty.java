package com.kosa.pro.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


/**
 * globals.properties 모음 ParentController에서 로드하여 객체 접근 방법으로 코딩 가능 globals.properties를 추가하면 이 클래스에도 getter/setter를 추가해야 함.
 * 
 * @author kky
 *
 */
@Component
public class GlobalProperty {
	
	@Value("${globals.web.mode}")
	String _sWebMode;
	
	@Value("${site.baseTitle}")
	String _sHTMLTitle;
	
	@Value("${site.pageTitle}")
	String _sPageTitle;
	
	@Value("${session.name.admin}")
	String _sSessionNameAdmin;
	
	@Value("${session.name.user}")
	String _sSessionNameUser;
	
	@Value("${cannot.using.id}")
	String _sCannotUsingID;
	
	@Value("${url.host.local}")
	String _sHostLocal;
	
	@Value("${url.host.dev}")
	String _sHostDev;
	
	@Value("${url.admin.root}")
	String _sAdminRoot;
	
	@Value("${url.admin.login}")
	String _sAdminLoginURL;
	
	@Value("${url.admin.main}")
	String _sAdminMainURL;
	
	@Value("${url.front.login}")
	String _sFrontLoginURL;
	
	@Value("${url.front.main}")
	String _sFrontMainURL;
	
	@Value("${view.alert}")
	String _sViewAlert;
	
	@Value("${common.date.type}")
	String _sDateFormat;
	
	@Value("${common.time.type}")
	String _sTimeFormat;
	
	@Value("${upload.path.physical.local}")
	String _sPathPhysicalLocal;
	
	@Value("${upload.path.physical.dev}")
	String _sPathPhysicalDev;
	
	@Value("${upload.path.physical.op}")
	String _sPathPhysicalOp;
	
	@Value("${upload.path.virtual}")
	String _sPathVirtual;
	
	@Value("${upload.path.files}")
	String _sPathFiles;
	
	@Value("${upload.path.test}")
	String _sPathTest;
	
	@Value("${upload.path.editor}")
	String _sPathEditor;
	
	@Value("${upload.path.image}")
	String _sPathImage;
	
	@Value("${upload.path.temp}")
	String _sPathTemp;
	
	/**
	 * 웹 모드 : local, dev, op
	 * 
	 * @return
	 */
	public String getWebMode() {
		return _sWebMode;
	}
	
	/**
	 * 
	 * @return 기본 타이틀
	 */
	public String getHTMLTitle() {
		return _sHTMLTitle;
	}
	
	/**
	 * @return 페이지 타이틀 속성 이름. model.addAttribute()에 사용되는 타이틀 바인딩용 attribute 이름
	 */
	public String getPageTitle() {
		return _sPageTitle;
	}
	
	/**
	 * @return 관리자 세션 이름
	 */
	public String getSessionNameForAdmin() {
		return _sSessionNameAdmin;
	}
	
	/**
	 * @return 사용자 세션 이름
	 */
	public String getSessionNameForUser() {
		return _sSessionNameUser;
	}
		
	/**
	 * 
	 * @return 사용할 수 없는 아이디 문자열
	 */
	public String[] getCannotUseIDs() {
		return _sCannotUsingID.split(",");
	}
	
	/**
	 * 관리자 루트
	 * 
	 * @return
	 */
	public String getAdminRoot() {
		return _sAdminRoot;
	}
	
	/**
	 * @return 관리자 로그인 URL
	 */
	public String getAdminLoginURL() {
		return _sAdminLoginURL;
	}
	
	/**
	 * @return 관리자 메인 URL
	 */
	public String getAdminMainURL() {
		return _sAdminMainURL;
	}
	
	/**
	 * @return 사용자 로그인 URL
	 */
	public String getFrontLoginURL() {
		return _sFrontLoginURL;
	}
	
	/**
	 * @return 사용자 메인 URL
	 */
	public String getFrontMain() {
		return _sFrontMainURL;
	}
	
	/**
	 * 
	 * @return 스프링 컨트롤러 alert 출력용 URL
	 */
	public String getViewAlert() {
		return _sViewAlert;
	}
	
	/**
	 * 날짜 표시 유형 : SearchVO 참조
	 * 
	 * @return
	 */
	public String getDateFormat() {
		return _sDateFormat;
	}
	
	/**
	 * 시각 표시 유형
	 * 
	 * @return
	 */
	public String getTimeFormat() {
		return _sTimeFormat;
	}
	
	/**
	 * 날짜 + 시각 표시 유형
	 * @return
	 */
	public String getDateTimeFormat() {
		return _sDateFormat + " " + _sTimeFormat;
	}
	
	/**
	 * 파일 업로드 물리 경로 globals.properties - upload.path.physical 참조 : globals.web.mode 값에 따라 값이 달라짐. 기본값 local
	 * 
	 * @return
	 */
	public String getUploadPathPhysical() {
		if (this.getWebMode().equals("dev"))
			return this._sPathPhysicalDev;
		else if (this.getWebMode().equals("op"))
			return this._sPathPhysicalOp;
		else
			return this._sPathPhysicalLocal;
	}
	
	/**
	 * 업로드 루트 가상디렉토리
	 * 
	 * @return
	 */
	public String getUploadPathVirtual() {
		return this._sPathVirtual;
	}
	
	/**
	 * 업로드 일반 파일 경로 (서브 디렉토리)
	 * 
	 * @return
	 */
	public String getUploadPathFiles() {
		return this._sPathFiles;
	}
	
	
	/**
	 * 업로드 테스트 경로 (서브 디렉토리)
	 * 
	 * @return
	 */
	public String getUploadPathTest() {
		return this._sPathTest;
	}
	
	/**
	 * 업로드 에디터 경로 (서브 디렉토리)
	 * 
	 * @return
	 */
	public String getUploadPathEditor() {
		return _sPathEditor;
	}
	
	/**
	 * 업로드 이미지 경로 (서브 디렉토리)
	 * 
	 * @return
	 */
	public String getUploadPathImage() {
		return _sPathImage;
	}
	
}
