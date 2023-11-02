<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/jsp/include/top.jsp"%>

<div class="section search-result-wrap">
	<div class="container">
		<div class="sidebar-box search-form-wrap mb-4">
			<form action="#" class="sidebar-search-form">
				<select class="form-select">
					<option>제목</option>
					<option>작성자</option>
					<option>단체이름</option>
					<option>내용</option>
				</select>
				<form class="d-flex">
					<input class="form-control me-sm-2" type="search" >
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
				</form>
			</form>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="heading">Category: 시설봉사</div>
			</div>
		</div>
		<div class="row posts-entry">
			<div class="col-lg-8">
				<div class="blog-entry d-flex blog-entry-search-item">

					<a href="single.html" class="img-link me-4">
						<img src="/template/images/img_1_sq.jpg" alt="Image" class="img-fluid">
					</a>

					<div>
						<span class="date">2023-10-12  <span style="float:right;">조회수 : 501</span></span>
						<h2 class="mt-1"><a href="single.html">[제주] 저는 자랑스러운 JDC 드림나눔 봉사단 담당자입니다</a></h2>
						<div class="review-text-area">
							<span>안녕하십니까? 저는 JDC 드림나눔 봉사단를 담당하고 있는 강윤정입니다.
								이 자리에 제가 서도 될까? 하는 부끄러운 마음이 크지만 ‘JDC 드림나눔 봉사단’을 소개하고 봉사활동이 얼마나 보람된 일인지 알려드리고 싶어 이 자리에 섰습니다.
							<span>
						</div>
						<a href="single.html" class="btn btn-sm btn-outline-primary mt-3">Read More</a>
						<div class="love-list">
							<i class="bi bi-hand-thumbs-up-fill recommend-list"></i>
							<span>550</span>
						</div>
						   
					</div>
				</div>

				<div class="blog-entry d-flex blog-entry-search-item">
					<a href="single.html" class="img-link me-4">
						<img src="/template/images/img_2_sq.jpg" alt="Image" class="img-fluid">
					</a>
					<div>
						<span class="date">2023-10-23 <span style="float:right;">조회수 : 5201</span></span>
						<h2 class="mt-1"><a href="single.html">[경북] 소소한 일상으로부터의 변화, 아무튼 봉사</a></h2>
						<div class="review-text-area">
							<span>적극적이고 활발하며 친구들을 좋아하던 저! 학교에서 하는 환경정화나, 어려운 친구 도와주는 일들을 하며 선생님께 칭찬을 받다 보니

								자연스레 봉사활동에 관심이 생기게 되었습니다. 그러던 중 학교 밖에서도 봉사활동을 하고 싶어, 부모님을 따라 첫 교외 봉사를 나가게 되었습니다.
								
								낯설고 어렵게만 느껴지던 처음 뵙는 할머니께 엄마는 미소를 가득 머금은 얼굴로 한분 한분 인사를 나누며, 할머니들의 안부를 묻는 모습을 보면서,
								<span>
						</div>
						<a href="single.html" class="btn btn-sm btn-outline-primary mt-3">Read More</a>
						<div class="love-list">
							<i class="bi bi-hand-thumbs-up-fill recommend-list"></i>
							<span>5520</span>
						</div>
					</div>
				</div>

				<div class="row text-start pt-5 border-top">
					<div class="col-md-12">
						<div class="custom-pagination">
							<span>1</span>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<span>...</span>
							<a href="#">15</a>
						</div>
					</div>
				</div>




			</div>

			<div class="col-lg-4 sidebar">

				

				<!-- END sidebar-box -->
				<div class="sidebar-box">
					<h3 class="heading">인기 후기글</h3>
					<div class="post-entry-sidebar">
						<ul>
							<li>
								<a href="">
									<img src="/template/images/img_1_sq.jpg" alt="Image placeholder" class="me-4 rounded">
									<div class="text">
										<h4>[제주] 저는 자랑스러운 JDC 드림나눔 봉사단 담당자입니다</h4>
										<div class="post-meta">
											<span class="mr-2">2023-10-12 </span>
										</div>
									</div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="/template/images/img_2_sq.jpg" alt="Image placeholder" class="me-4 rounded">
									<div class="text">
										<h4>[경북] 소소한 일상으로부터의 변화, 아무튼 봉사</h4>
										<div class="post-meta">
											<span class="mr-2">2023-10-23 </span>
										</div>
									</div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="/template/images/img_3_sq.jpg" alt="Image placeholder" class="me-4 rounded">
									<div class="text">
										<h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>
										<div class="post-meta">
											<span class="mr-2">2023-10-30 </span>
										</div>
									</div>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- END sidebar-box -->

				<div class="sidebar-box">
					<h3 class="heading">Categories</h3>
					<ul class="categories">
						<li><a href="#">시설봉사 <span>(12)</span></a></li>
						<li><a href="#">전문봉사 <span>(22)</span></a></li>
						<li><a href="#">지역사회봉사 <span>(37)</span></a></li>
						<li><a href="#">금,물품봉사 <span>(37)</span></a></li>
						<li><a href="#">해외봉사 <span>(42)</span></a></li>
						<li><a href="#">기타봉사 <span>(5)</span></a></li>
						<li><a href="#">재가봉사 <span>(14)</span></a></li>
						<li><a href="#">헌혈 <span>(124)</span></a></li>
					</ul>
				</div>
				
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>   	
	