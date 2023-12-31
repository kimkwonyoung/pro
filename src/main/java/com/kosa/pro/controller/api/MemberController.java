package com.kosa.pro.controller.api;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosa.pro.config.auth.PrincipalDetails;
import com.kosa.pro.config.exception.ExistMemberException;
import com.kosa.pro.config.exception.LoginBenException;
import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.auth.KakaoProfile;
import com.kosa.pro.model.auth.LoginMember;
import com.kosa.pro.model.auth.OAuthToken;
import com.kosa.pro.service.MemberService;


@Controller
public class MemberController extends PrtController {
	
	@Autowired
	MemberService memberService;
	


	//로그인 양식 
	@GetMapping("/auth/loginForm")
	public String loginForm(Model model,
			@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "exception", required = false) String exception) {
		super.setPageSubTitle("로그인", model);
		String url = getConfig().getHostLocal();
		if ("dev".equals(getConfig().getWebMode()))
			url = getConfig().getHostDev();
		
		model.addAttribute("url", url);
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
		return "member/loginForm";
	}
	@GetMapping("/login/oauth2/code/google")
	public String googleLogin(Model model) {
		System.out.println("여기왔냐 구글로그인");
		return "index";
	}

//	//회원 가입 양식 
//	@GetMapping("/auth/joinForm.do")
//	public String joinForm() {
//		return "member/joinForm";
//	}
//	
//	//회원 정보 수정 양식
//	@GetMapping("/user/updateForm.do")
//	public String updateForm() {	
//		return "member/updateForm";
//	}
	
	@ExceptionHandler(LoginBenException.class)
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(String code) { // Data를 리턴해주는 컨트롤러 함수
		System.out.println("카카오로그인 컨트롤러 url : /auth/kakao/callback ");
		// POST방식으로 key=value 데이터를 요청 (카카오쪽으로)
		// Retrofit2
		// OkHttp
		// RestTemplate
		RestTemplate restTemplate = new RestTemplate();
		
		String kakaoUri = getConfig().getHostLocal() + "/auth/kakao/callback";
		//웹모드 배포서버면 uri 수정
		System.out.println("111111카카오uri = " + kakaoUri);
		if ("dev".equals(getConfig().getWebMode())) {
			kakaoUri = getConfig().getHostDev() + "/auth/kakao/callback";
		} 
		System.out.println("222222카카오uri = " + kakaoUri);
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	
		
		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "d7267f5ca33a7f3cec9546ca74dae03a");
//		params.add("redirect_uri", "http://localhost:8090/auth/kakao/callback");
		params.add("redirect_uri", kakaoUri);
		params.add("code", code);
		
		System.out.println("httpheaders= " + headers.toString());
		System.out.println("httpBody = " + params.toString());
		
		
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response = restTemplate.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
		);
		
		//응답 결과 body 출력
		System.out.println("https://kauth.kakao.com/oauth/token의 body = " + response.getBody());
		
		// Gson, Json Simple, ObjectMapper (라이브러리들)
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println("카카오 엑세스 토큰 : "+oauthToken.getAccess_token());
		
		RestTemplate rt2 = new RestTemplate();
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token()); //Bearer 공백 필수
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);
		
		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest2,
				String.class
		);
		System.out.println(response2.getBody());
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		// User 오브젝트 : username, password, email
		System.out.println("카카오 아이디(번호) : " + kakaoProfile.getId());
		System.out.println("카카오 이메일 : " + kakaoProfile.getKakao_account().getEmail());
		System.out.println("카카오 이름 : " + kakaoProfile.getProperties().getNickname());
		System.out.println("카카오 프로필 이미지 : " + kakaoProfile.getProperties().getProfile_image());
		
		
		MemberVO kakaoMember = MemberVO.builder()
				.memId(kakaoProfile.getKakao_account().getEmail())
				.name(kakaoProfile.getProperties().getNickname())
				.auth("USER")
				.platform("kakao")
				.profilImage(kakaoProfile.getProperties().getProfile_image())
				.build();
		
		// 가입자 혹은 비가입자 체크 해서 처리
		try {
			memberService.insertMember(kakaoMember);
			System.out.println("기존 회원이 아니기에 자동 회원가입을 진행함");
		} catch (LoginBenException e) {
			String msg;
			try {
				msg = URLEncoder.encode("정지된 계정 입니다.", "UTF-8");
				return "redirect:/auth/loginForm?error=true&exception=" + msg;
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (ExistMemberException e) {
			System.out.println("기존에 회원 가입된 경우 다음으로 진행함");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		LoginMember kakaoLoginMember = memberService.findMemid(kakaoMember.getMemId());
		
		System.out.println("자동 로그인을 진행합니다.");
		System.out.println("카카오정보 = " + kakaoLoginMember);
		// 로그인 처리 
		PrincipalDetails principalDetails = new PrincipalDetails(kakaoLoginMember, null);
		Authentication authentication = new UsernamePasswordAuthenticationToken(
				principalDetails, // 나중에 컨트롤러에서 DI해서 쓸 때 사용하기 편함.
				null, // 토큰 인증시 패스워드는 알수 없어 null 값을 전달하는 것임  
				principalDetails.getAuthorities()); //사용자가 소유한 역할 권한을 전달한다 

		// 강제로 시큐리티의 세션에 접근하여 값 저장
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		
		return "redirect:/main";
	}
	
	
}