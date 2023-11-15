<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


	<div class="search-result-wrap" style="margin-top:50px; margin-bottom:50px;">
		<div class="container">
			<div style="display: flex; justify-content: center;">
				<div style="width:75%;">
					<div class="recuit">봉사자모집 및 신청</div>
					<br>
					<!-- 검색 구간 -->
					<div>※ [모집중] 이라도 VolunTree 외 다른 경로를 통해 자원봉사자가 모집되는 경우 참여가 어려울 수 있습니다.</div>
					<br>
				<div class="search_section">
					<form action="/recruit/list" >
						<div class="form-css" style="width:100%;">
	
							<!-- 봉사 지역 -->
						<div style="width:100%;">
						<div class="form-region" style="margin-right:7%;">
							<label for="form-select">봉사지역 </label>
							<select class="form-select" name="area"  title="활동지역 선택" onchange="drawAreaList(this);" style="width:170px;">
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
	
							<select class="form-select" name="area"  title="활동지역 선택" onchange="drawAreaList(this);" style="width:170px;">
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
							<input type="date" class="form-keyword" name="sttdte" title="봉사기간 시작일"  style="width:170px;"><span class="dash"> ~ </span><input type="date" class="form-keyword" name="enddte" title="봉사기간 종료일"  style="width:170px;" >
						</div>
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

						<!-- 검색 조건 -->
						<div class="form-search" style="float:right;">
							<label for="form-select">검색조건 </label>
							<select class="form-select" id="acttype" name="acttype" title="활동분야 선택">
								<option value="">선택</option>
								<option value="recruitTitle">제목</option>
								<option value="groupName">작성자</option>
								<option value="recruitContent">내용</option>
							</select>
							<input class="form-keyword" name="searchWord" type="search" value="${search.searchWord }" >
							<button type="submit" id="search" style="font-size: 17px;width: 70px;height: 40px;background-color: black;">검색</button>

						</div>
						
						<!-- 검색 출력  -->
	
					</div>
					</form>
				</div>	

				</div>
			</div>


			<div class="innerinner" style="width: 100%;margin: 0;padding: 0;display:flex;justify-content:center;">
			<div class="inner1" style="width: 100%;">
    
				<div class="inner2">
					<div class="row posts-entry">
						<div class="sss" style="margin-bottom:50px;">
						
							<c:forEach var="recruit" items="${list}">
							<div class="blog-entry d-flex blog-entry-search-item" style="margin-bottom:70px;">
								<div style="width:100%;">
									<div class="date" style="margin-bottom: 10px;">
										<!-- 모집 날짜 정보를 저장하는 hidden input -->

										<ul class="tags">
											<li style="font-size:18px;"><a href="#" id="recruitLink${status.index}" class="recruitLink" style="width: 100px; text-align: center; padding: 6px;">${recruit.recruitState}</a></li>
											<li id="recruitList"><a href="#" style=" width: 100px; text-align: center; padding: 6px; ">${recruit.volunRegion1}</a></li>
											
											<!-- 이거 디데이 자바스크립트로 설정하기 -->
											<!-- 여러 개의 리스트 아이템이 있을 때, 각각에 대한 클래스 추가 -->
											<li class="recruit-list-item">
											    <a href="#" style="background-color: #fff28d; width: 100px; text-align: center; padding: 6px;" >
											        <span class="dday-element"></span>
											    </a>
											    <input type="hidden" class="recruit-start-date" name="recruitStartDate" value="${recruit.recruitStartDate}">
											    <input type="hidden" class="recruit-end-date" name="recruitEndDate" value="${recruit.recruitEndDate}">
											</li>
												
																						
											
										</ul>
									</div>
									
<%-- 									<a href="/exam/get.do?boardNum=${board.boardNum}">${board.title}</a> --%>
									<p class="title"><a href="/recruit/detail?recruitSeq=${recruit.recruitSeq}" style="font-size:30px;">${recruit.recruitTitle}</a></p>
									<div style="margin-top:10px;">
										<div class="data clear">
										<div style="width:100%;">
												<dl style="width:20%; font-size:18px;">
													<dt>신청/필요인원:</dt>
													<dd>
														<span>${recruit.count}</span>/<span>${recruit.memCount}</span>
													</dd>
												</dl>
												<dl style="width:35%; font-size:18px;">
													<dt>봉사기간:</dt>
													<dd>
													
													  <span><fmt:formatDate value="${recruit.volunStartDate}" pattern="yyyy-MM-dd" /></span>~
													  <span><fmt:formatDate value="${recruit.volunEndDate}" pattern="yyyy-MM-dd" /></span>

													</dd>
												</dl>
												<dl style="width:35%; font-size:18px;" >
													<dt>모집기관:</dt>
													<dd>${recruit.groupName}</dd>
												</dl>
										</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							

						</div>
						
		
					</div>
				</div>
			</div>
		</div>
	
		
			<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
		</div>
		
	</div>
	<script>
    var recruitState${status.index} = "${recruit.recruitState}";

    var recruitLink${status.index} = document.getElementById("recruitLink${status.index}");

    if (recruitState${status.index} === '모집완료') {
      recruitLink${status.index}.style.backgroundColor = 'red';
    }
  	</script>
	<script>
	// calculateDday 함수 정의
	function calculateDday(targetDate) {
	    var target = new Date(targetDate);
	    var today = new Date();
	    var timeDiff = target - today;
	    var daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));

	    if (daysDiff === 0) {
	        return "금일마감";
	    } else if (daysDiff > 0) {
	        return "D-" + daysDiff;
	    } else {
	        return "D+" + Math.abs(daysDiff);
	    }
	}

	// DOMContentLoaded 이벤트 리스너
	document.addEventListener("DOMContentLoaded", function() {
	    // 각 recruit-start-date 클래스에 대해 D-Day 계산 및 할당
	    var dateElements = document.getElementsByClassName("recruit-start-date");

	    for (var i = 0; i < dateElements.length; i++) {
	        var targetDateString = dateElements[i].value;
	        var targetDate = new Date(targetDateString.replace(/-/g, "/"));
	        var dday = calculateDday(targetDate);

	        // 해당하는 D-Day 값을 클래스가 dday-element인 요소에 할당
	        document.getElementsByClassName("dday-element")[i].innerHTML = dday;
	    }
	});


	</script>
	
<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>