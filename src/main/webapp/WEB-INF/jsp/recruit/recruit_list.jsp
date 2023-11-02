<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<div class="search-result-wrap">
		<div class="container">
			<div style="display: flex; justify-content: center;">
				<div style="width:75%;">
					<div class="recuit">봉사 신청</div>
					<br>
					<!-- 검색 구간 -->
					<div>※ [모집중] 이라도 **외 다른 경로를 통해 자원봉사자가 모집되는 경우 참여가 어려울 수 있습니다.</div>
					<br>
				<div class="search_section">
					<form>
						<div class="form-css">
	
							<!-- 봉사 지역 -->
						<div class="form-region">
							<label for="form-select">봉사지역 </label>
							<select class="form-select" name="area"  title="활동지역 선택" onchange="drawAreaList(this);">
								<option value="">선택1</option>
								<option value="0100">중앙</option>
								<option value="0101">서울</option>
								<option value="0102">부산</option>
								<option value="0103">대구</option>
								<option value="0104">인천</option>
								<option value="0105">광주</option>
								<option value="0106">대전</option>
								<option value="0107">울산</option>
								<option value="0117">세종</option>
								<option value="0108">경기</option>
								<option value="0109">강원</option>
								<option value="0110">충북</option>
								<option value="0111">충남</option>
								<option value="0112">전북</option>
								<option value="0113">전남</option>
								<option value="0114">경북</option>
								<option value="0115">경남</option>
								<option value="0116">제주</option>
							</select>
	
							<select class="form-select" name="area"  title="활동지역 선택" onchange="drawAreaList(this);">
								<option value="">선택2</option>
								<option value="0100">중앙</option>
								<option value="0101">서울</option>
								<option value="0102">부산</option>
								<option value="0103">대구</option>
								<option value="0104">인천</option>
								<option value="0105">광주</option>
								<option value="0106">대전</option>
								<option value="0107">울산</option>
								<option value="0117">세종</option>
								<option value="0108">경기</option>
								<option value="0109">강원</option>
								<option value="0110">충북</option>
								<option value="0111">충남</option>
								<option value="0112">전북</option>
								<option value="0113">전남</option>
								<option value="0114">경북</option>
								<option value="0115">경남</option>
								<option value="0116">제주</option>
							</select>
						</div>
	
							<!-- 봉사 기간 -->
						<div class="form-calendar">
							<label for="date-select">봉사기간 </label>
							<input type="date" class="form-date" name="sttdte" title="봉사기간 시작일" ><span class="dash">~</span><input type="date" class="form-date" name="enddte" title="봉사기간 종료일" >
						</div>
						<br>
						<!-- 모집 현황 -->
						<div class="form-status">
							<label for="form-select">모집현황 </label>
							<select class="form-select" name="status">
								<option value="">선택</option>
								<option value="0115">모집중</option>
								<option value="0116">모집완료</option>
							</select>
						</div>
	
						<!-- 봉사 분야 -->
						<div class="form-acttype">
							<label for="form-select">봉사분야 </label>
							<select class="form-select" id="acttype" name="acttype" title="활동분야 선택">
								<option value="">선택</option>
								<option value="01">시설봉사</option>
								<option value="02">재가봉사</option>
								<option value="03">전문봉사</option>
								<option value="04">지역사회봉사</option>
								<option value="05">금,물품봉사</option>
								<option value="06">해외봉사</option>
								<option value="07">헌혈</option>
								<option value="99">기타봉사</option>
							</select>
						</div>
						<br>
						<!-- 검색 조건 -->
						<div class="form-search">
							<label for="form-select">검색조건 </label>
							<select class="form-select" id="acttype" name="acttype" title="활동분야 선택">
								<option value="">선택</option>
								<option value="01">제목</option>
								<option value="01">내용</option>
							</select>
							<input type="type" class="form-keyword">
						</div>
						
						<!-- 검색 출력  -->
						<input type="submit" value="검색">
	
					</div>
					</form>
				</div>	

				</div>
			</div>


			
			<div class="inner1">
				<div class="inner2">
					<div class="row posts-entry">
						<div class="sss">
						
							
							<div class="blog-entry d-flex blog-entry-search-item" style="margin-bottom:50px;">
								<div>
									<div class="date" style="margin-bottom: 10px;">
										<ul class="tags">
											<li><a href="#">모집중</a></li>
											<li><a href="#" style="background-color: #50a9ed;">대전</a></li>
											<li><a href="#" style="background-color: #ffea61;">D-5</a></li>
										</ul>
										</div>
										<br>
										<p class="title"><a href="recruit/detail">바우뫼주간보호센터 이미용 자원봉사자 모집</a></p>
										<div>
											<div class="data clear">
													<dl>
														<dt>신청/필요인원:</dt>
														<dd>
															<span>0/</span><span>3</span>
														</dd>
													</dl>
													<dl>
														<dt>봉사기간:</dt>
														<dd>2023-10-30~ 2023-10-30</dd>
													</dl>
													<dl>
														<dt>모집기관:</dt>
														<dd>대한사회복지회 잉아터</dd>
													</dl>
													<p class="period">
														</p>
											</div>
										</div>
								</div>
							</div>

							<div class="blog-entry d-flex blog-entry-search-item" style="margin-bottom:50px;">
								<div>
									<div class="date" style="margin-bottom: 10px;">
										<ul class="tags">
											<li><a href="#">모집중</a></li>
											<li><a href="#" style="background-color: #50a9ed;">대전</a></li>
											<li><a href="#" style="background-color: #ffea61;">D-5</a></li>
										</ul>
										</div>
										<br>
										<p class="title"><a href="single.html">바우뫼주간보호센터 이미용 자원봉사자 모집</a></p>
										<div>
											<div class="data clear">
													<dl>
														<dt>신청/필요인원:</dt>
														<dd>
															<span>0/</span><span>3</span>
														</dd>
													</dl>
													<dl>
														<dt>봉사기간:</dt>
														<dd>2023-10-30~ 2023-10-30</dd>
													</dl>
													<dl>
														<dt>모집기관:</dt>
														<dd>대한사회복지회 잉아터</dd>
													</dl>
													<p class="period">
														</p>
											</div>
										</div>
								</div>
							</div>

							<div class="blog-entry d-flex blog-entry-search-item" style="margin-bottom:50px;">
								<div>
									<div class="date" style="margin-bottom: 10px;">
										<ul class="tags">
											<li><a href="#">모집중</a></li>
											<li><a href="#" style="background-color: #50a9ed;">대전</a></li>
											<li><a href="#" style="background-color: #ffea61;">D-5</a></li>
										</ul>
										</div>
										<br>
										<p class="title"><a href="single.html">바우뫼주간보호센터 이미용 자원봉사자 모집</a></p>
										<div>
											<div class="data clear">
													<dl>
														<dt>신청/필요인원:</dt>
														<dd>
															<span>0/</span><span>3</span>
														</dd>
													</dl>
													<dl>
														<dt>봉사기간:</dt>
														<dd>2023-10-30~ 2023-10-30</dd>
													</dl>
													<dl>
														<dt>모집기관:</dt>
														<dd>대한사회복지회 잉아터</dd>
													</dl>
													<p class="period">
														</p>
											</div>
										</div>
								</div>
							</div>
							
		
							<div class="blog-entry d-flex blog-entry-search-item">
								<div>
									<div class="date" style="margin-bottom: 10px;">
										<ul class="tags">
											<li><a href="#">모집중</a></li>
											<li><a href="#" style="background-color: #50a9ed;">대전</a></li>
											<li><a href="#" style="background-color: #ffea61;">D-5</a></li>
										</ul>
										</div>
										<br>
										<p class="title"><a href="single.html">바우뫼주간보호센터 이미용 자원봉사자 모집</a></p>
										<div>
											<div class="data clear">
													<dl>
														<dt>신청/필요인원:</dt>
														<dd>
															<span>0/</span><span>3</span>
														</dd>
													</dl>
													<dl>
														<dt>봉사기간:</dt>
														<dd>2023-10-30~ 2023-10-30</dd>
													</dl>
													<dl>
														<dt>모집기관:</dt>
														<dd>대한사회복지회 잉아터</dd>
													</dl>
													<p class="period">
														</p>
											</div>
										</div>
								</div>
							</div>
							
							
							<div class="blog-entry d-flex blog-entry-search-item">
								<div>
									<div class="date" style="margin-bottom: 10px;">
										<ul class="tags">
											<li><a href="#">모집중</a></li>
											<li><a href="#" style="background-color: #50a9ed;">대전</a></li>
											<li><a href="#" style="background-color: #ffea61;">D-5</a></li>
										</ul>
										</div>
										<br>
										<p class="title"><a href="single.html">바우뫼주간보호센터 이미용 자원봉사자 모집</a></p>
										<div>
											<div class="data clear">
													<dl>
														<dt>신청/필요인원:</dt>
														<dd>
															<span>0/</span><span>3</span>
														</dd>
													</dl>
													<dl>
														<dt>봉사기간:</dt>
														<dd>2023-10-30~ 2023-10-30</dd>
													</dl>
													<dl>
														<dt>모집기관:</dt>
														<dd>대한사회복지회 잉아터</dd>
													</dl>
													<p class="period">
														</p>
											</div>
										</div>
								</div>
							</div>
							
		
							

						</div>
						<div class="row text-start pt-5 border-top">
							<div class="col-md-12">
								<div class="custom-pagination" style="margin-bottom: 2rem;">
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
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>