<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/jsp/include/top.jsp"%>

<section class="section bg-light">
	<div class="container">
		<div class="row align-items-stretch retro-layout">
			<div class="col-md-8">
				<a href="" class="h-entry img-5 h-100 gradient">
					<div class="featured-img" style="background-size: 100% 100%; background-image: url('/template/images/mainimage.png');"></div>
				</a>
		</div>
		<div class="col-md-4">
			<a href="single.html" class="h-entry mb-30 v-height gradient">

				<div class="featured-img" style="background-image: url('/template/images/img_3_horizontal.jpg');"></div>

				<div class="text">
					<span class="date">10월 이달의 봉사왕</span>
					<h2>후기 보러 가기</h2>
				</div>
			</a>
			<a href="single.html" class="h-entry v-height gradient">

				<div class="featured-img" style="background-image: url('/template/images/img_4_horizontal.jpg');"></div>

				<div class="text">
					<span class="date">10월 이달의 단체왕</span>
					<h2>단체 보러 가기</h2>
				</div>
			</a>
			</div>
		</div>
	</div>
</section>
<!-- End retroy layout blog posts -->

<!-- Start posts-entry -->
<section class="section posts-entry posts-entry-sm bg-light">
	<div class="container" style="height: 250px;">
		<div class="row" style="height: 250px;">
			<div class="col-md-6 col-lg-3 mx-5" style="height: 250px;">
				<div class="blog-entry main-bd" >
					<h2 class="notice-h2" style="font-size: 30px; color: black;">공지사항</h2> <a href="" class="notice-a">+</a>
					<ul class="main-ul">
					<c:forEach var="notice" items="${noticeList }">
						<li>${notice.title }</li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 mx-5" style="height: 250px;">
				<div class="blog-entry main-bd">
					<h2 class="notice-h2" style="font-size: 30px; color: black;">봉사자 모집</h2> <a href="/recruit/list" class="notice-a">+</a>
					<ul class="main-ul">
					<c:forEach var="recruit" items="${recruitList }">
						<li><a href="/recruit/detail?recruitSeq=${recruit.recruitSeq }">${recruit.recruitTitle }</a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 mx-5" style="height: 250px;">
				<div class="blog-entry main-bd">
					<h2 class="notice-h2" style="font-size: 30px; color: black;">자주 묻는 질문</h2> <a href="" class="notice-a">+</a>
					<ul class="main-ul">
						<li>[APP] VMS APP 로그인 시 비밀번호가 틀리다고 나와요</li>
						<li>[회원정보] 봉사자 회원코드(연번)는 어디서 확인하나요</li>
						<li>[회원정보] 회원가입은 어떻게 진행하나요?</li>
						<li>[봉사실적] 헌혈 군가산점 인정 관련 안내</li>
						<li>[회원정보] 회원가입 시 실명인증이 안되는 경우 실명인증 하는 방법</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End posts-entry -->

<section class="section">
	<div class="container">

		<div class="row mb-4">
			<div class="col-sm-6">
				<h2 class="posts-entry-title" style="font-size: 30px; color: black;">생생한 후기</h2>
			</div>
			<div class="col-sm-6 text-sm-end"><a href="/review/list" class="read-more">더보기</a></div>
		</div>

		<div class="row">
		<c:forEach var="top" items="${listTop3 }">
			<div class="col-lg-4 mb-4">
				<div class="post-entry-alt">
					<a href="/review/info?reviewSeq=${top.reviewSeq }" class="img-link"><img src="/files/${top.imageSeq}" alt="Image" class="img-fluid profilimage"></a>
					<div class="excerpt">
						<h2><a href="single.html">${top.reviewTitle }</a></h2>
						<div class="post-meta align-items-center text-left clearfix">
							<figure class="author-figure mb-0 me-3 float-start"><img src="${top.member.profilImage }" alt="Image" class="img-fluid"></figure>
							<span class="d-inline-block mt-1">By <a href="#">${top.member.name }</a></span>
							<span>&nbsp;-&nbsp; ${top.modDate }</span>
						</div>
						<div class="text-area">
							<span>${top.reviewContent }</span>
						</div>
						<a href="/review/list" class="read-more">Continue Reading</a>	
					</div>
					
				</div>
			</div>
		</c:forEach>	
			
		</div>
		
	</div>
</section>
<script>
function resizeImages() {
    const images = document.querySelectorAll('.profilimage'); // 모든 이미지 요소 선택
    const maxWidth = 350; // 원하는 최대 가로 폭
    const maxHeight = 250; // 원하는 최대 세로 높이

    images.forEach(img => {
      // 이미지 크기가 최대 크기를 넘어가면 조절
      if (img.width > maxWidth || img.height > maxHeight) {
        if (img.width > maxWidth) {
          img.height = (maxWidth / img.width) * img.height;
          img.width = maxWidth;
        }
        if (img.height > maxHeight) {
          img.width = (maxHeight / img.height) * img.width;
          img.height = maxHeight;
        }
      }
    });
  }

  // 페이지 로드 시 이미지 크기 조절 함수 실행
  window.addEventListener('load', resizeImages);

  // 화면 크기가 변경될 때도 이미지 크기 조절 함수 실행
  window.addEventListener('resize', resizeImages);
</script>
<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>   