<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


	<div class="section search-result-wrap">
		<div class="container">
			<br>
			<br>
			<div class="detail_section">
			<div class="form-css">
			<br>

			<div class="inner3">
				<div class="inner4">
					<div>
						<div>
							<div class="inner-detail-wrap">
								<div class="inner5-detail">
									<span class="date">
										<ul class="tags">
											<li><a href="#" style="padding: 10px 20px;" >모집중</a></li>
											<li><a href="#" style="padding: 10px 20px;" >대전</a></li>
											<li><a href="#" style="padding: 10px 20px;">D-5</a></li>
											<span class="btn-frame" style="flex: 1;">
												<button class="btn">신청하기</button>
											</span>
										</ul>
									</span>
									<div class="detail-list">
										<div>
											<h3 style="font-weight: bold; margin: 20px 0px;">
												<span style="flex: 1;">반려인/비반려인 갈등완화 캠페인</span>
											</h3>
											<ul class="detail-ul">
												<li>혜화불주먹해적단</li>
												<li>작성일 : 2023-10-26</li>
												<li>조회수 : 3921</li>
												<li>추천수 : 591</li>
											</ul>
										</div>
									</div>
										<!-- <ul class="review-ul">
											<li>혜화불주먹해적단</li>
											<li>작성일 : 2023-10-26</li>
											<li>조회수 : 3921</li>
											<li>추천수 : 591</li>
										</ul> -->
										<br>
			
									<table class="table-review" style="margin-top: 50px;">
										<tr>
											<th>봉사기간</th>
											<td><span>2023-10-21</span> ~ <span>2023-10-29</span></td>
											<th>봉사분야</th>
											<td><span>시설봉사</span></td>
										</tr>
										<tr>
											<th>봉사단체</th>
											<td>혜화불주먹해적단</td>
											<th>봉사시간</th>
											<td><span>4</span>시간</td>
										</tr>
										<tr>
											<th>봉사지역</th>
											<td>서울시 종로구</td>
											<th>봉사장소</th>
											<td>혜화역</td>
										</tr>
										<tr>
											<th>봉사대상</th>
											<td>부족한친구들</td>
											<th>뭐넣지</th>
											<td>데이터</td>
										</tr>
			
									</table>

									<!-- 상세 내용 -->
									<div class="contents" style="font-size:16px; color="black;">
										- 봉사명 : 어르신 백일장 및 야유회 봉사자 모집<br>
										- 내용 :
										영진종합사회복지관에서 '성인문해교실' 프로그램 백일장 및 야유회 활동 보조 봉사자를 모집합니다.<br>
										1. 활동일자 : 2023년 11월 17일(금)<br>
										2. 활동시간 : 오전 9:00 ~ 18:00 / 총 9시간 / 점심 제공<br>
										3. 모집인원 : 2명<br>
										4. 활동내용 : 어르신 백일장 및 야유회 활동 보조<br>
										5. 문의 : 강주경 사회복지사(051-529-0005)<br>

									</div>

									<!-- 지도 -->
									<div class="map">
										<div id="map" style="width:100%;height:350px;"></div>
									</div>


									<div style="padding-bottom: 20px;">
									<!-- 담당자 정보 -->
									<div class="personInfo">
										<ul>
											<li>담당자:<span>김권영</span></li>
											<li>연락처:<span>010-2222-3333</span></li>
											<li>이메일:<span>ky90@naver.com</span></li>
										</ul>
									</div>

										<!-- 신청하기 버튼 -->
										<div style="margin-bottom:70px;">
											<div class="btn-frame" style="text-align: center;">
												<button class="btn">신청하기</button>
											</div>
										</div>
									</div>

									<hr>
									<div style="float:right;">
										<button style="padding: 10px 20px; background-color: #0c6ccb; color: white; border-radius: 4px; border: none; font-weight:bold;" >수정</button>
										<button style="padding: 10px 20px; background-color: #0c6ccb; color: white; border-radius: 4px; border: none; font-weight:bold;">목록</button>
									</div>

								</div>
							</div>
		
						</div>
		
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
    
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=259b6e4c0775108f360aa1e89a7a9d32"></script>
	<script>
	var mapContainer = document.getElementById('map'), 
			mapOption = { 
					center: new kakao.maps.LatLng(33.450701, 126.570667),
					level: 3 
			};
	
	
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	</script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>

    <script src="js/flatpickr.min.js"></script>


    <script src="js/aos.js"></script>
    <script src="js/glightbox.min.js"></script>
    <script src="js/navbar.js"></script>
    <script src="js/counter.js"></script>
    <script src="js/custom.js"></script>
	
    
<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>