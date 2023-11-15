<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/include/top.jsp"%>

<div class="login-form">
<div class="container-login" id="container-login">
  <form method="post" action="/auth/login">
  <div class="form-container-login sign-up-container-login">
        <h1>소셜 로그인</h1>
      <div class="social-container-login mt-5">
      
        <a href="/oauth2/authorization/google" ><img src="/images/Google.png" class="mb-2" style="width: 305px;"></a>
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=d7267f5ca33a7f3cec9546ca74dae03a&redirect_uri=http://localhost:8090/auth/kakao/callback&response_type=code"><img src="/images/kakao.png" /></a>
		
      </div>
<!--       <span>or use your account</span> -->
<!--       <input type="email" placeholder="Email" /> -->
<!--       <input type="password" placeholder="Password" /> -->
<!--       <a href="#">Forgot your password?</a> -->
<!--       <button>Login</button> -->
    
  </div>
  <div class="form-container-login sign-in-container-login" id="hide-div">
      <h1 class="mb-5">단체 로그인</h1>
      <input type="email" name="username" placeholder="Email" />
      <input type="password" name="password" placeholder="Password" />
      <div class="social-container-login">
      	<p>${error ? exception : ''}</p>
      </div>
      
      <button style="margin:auto;">Login</button>
      <div style="margin-top: 20px;">
      	<a href="#">단체 회원 가입</a>
      </div>
  </div>
  </form>
  <div class="overlay-container-login">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>단체 회원</h1>
        
        <button class="ghost" id="signIn">Sign In</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>소셜 회원</h1>
        
        <button class="ghost" id="signUp">Sign In</button>
      </div>
    </div>
  </div>
</div>
</div>
<script>
var msg = "${exception}";
if (msg) {
	//alert(msg);
	Swal.fire({
		  title: msg,
		  icon: "error"
		});
}

const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container-login');

signUpButton.addEventListener('click', () => {
  container.classList.add("right-panel-active");
  $("#hide-div").css("display", "none");
});

signInButton.addEventListener('click', () => {
  container.classList.remove("right-panel-active");
  $("#hide-div").css("display", "block");
});
</script>

<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>  