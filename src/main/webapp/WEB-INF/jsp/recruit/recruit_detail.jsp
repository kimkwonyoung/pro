<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


	<div class="section search-result-wrap">
		<div class="container">
			<div class="recuit" style="margin-left:13.5%;">봉사자모집 및 신청</div>
			<br>
			<div class="detail_section">
			<div class="form-css">
			<br>
			<!-- 그룹멤버시퀀스 / 글번호시퀀스 / 유저번호시퀀스 / 모집인원 / 현재모집된인원  -->
			<input type="hidden" id="GROUP_MEM_SEQ" name="groupMemSeq" value="${recruit.groupMemSeq}" >
			<input type="hidden" id="RECRUIT_SEQ" name="recruitSeq" value="${recruit.recruitSeq}" >
			<input type="hidden" id="MEM_SEQ" name="memSeq" value="${principal.user.memSeq}" >
			<input type="hidden" id="MEM_COUNT" name="memCount" value="${recruit.memCount}" >
			<input type="hidden" id="COUNT" name="count" value="${recruit.count}" >
		<!-- 	<form action="/recruit/add" method="post"> -->
			<div class="inner3">
				<div class="inner4">
					<div>
						<div>
							<div class="inner-detail-wrap">
								<div class="inner5-detail">
									<span class="date">
										<ul class="tags">
											<li><a href="#" style="padding: 10px 20px;" >${recruit.recruitState}</a></li>
											<li><a href="#" style="padding: 10px 20px;" >${recruit.volunRegion1}</a></li>
											<li><a href="#" style="padding: 10px 20px; background-color: #fff28d;"><span id="ddayElement"></span></a></li>
											<span class="btn-frame" style="flex: 1;">
												<button class="btn" style="font-size:19px;" onclick="add()">신청하기</button>
											</span>
										</ul>
									</span>
									<div class="detail-list">
										<div>
											<h3 style="font-weight: bold; margin: 20px 0px;">
												<span style="flex: 1;">${recruit.recruitTitle}</span>
											</h3>
											<ul class="detail-ul">
												<li>${recruit.groupName}</li>
												<li>작성일 : <span><fmt:formatDate value="${recruit.regDate}" pattern="yyyy-MM-dd" /></span></li>
												<!-- 수정해야함!! 컬럼추가!! -->
												<%-- <fmt:formatDate value="${recruit.regDate}" pattern="yyyy-MM-dd" /> --%>
											</ul>
										</div>
									</div>

										<br>
			
									<table class="table-review" style="margin-top: 50px;">
										<tr>
											<th>봉사기간</th>
											<td><span>${recruit.volunStartDate}</span> ~ <span>${recruit.volunEndDate}</span></td>
											<th>모집기간</th>
											<td><span>${recruit.recruitStartDate}</span> ~ <span>${recruit.recruitEndDate}</span></td>
										</tr>
										<tr>
											<th>봉사단체</th>
											<td>${recruit.groupName}</td>
											<th>봉사시간</th>
											<td><span>${recruit.volunTime}</span>시간</td>
										</tr>
										<tr>
											<th>봉사지역</th>
											<td>${recruit.volunRegion1} ${recruit.volunRegion2}</td>
											<th>봉사장소</th>
											<td>${recruit.volunAddr}</td>
										</tr>
										<tr>
											<th>봉사대상</th>
											<td>${recruit.volunTarget}</td>
											<th>봉사분야</th>
											<td><span>${recruit.volunCode}</span></td>
										</tr>
			
									</table>

									<!-- 상세 내용 -->
									<div class="contents" style="font-size:16px; color="black;">
										${recruit.recruitContent}
									</div>

									<!-- 지도 -->
									<div class="map">
										<div id="map" style="width:100%;height:350px;"></div>
									</div>


									<div style="padding-bottom: 20px;">
									<!-- 담당자 정보 -->
									<div class="personInfo" >
										<ul>
											<li><span style="color:rgb(255, 97, 97);">·  </span>담당자 : <span>${recruit.manager}</span></li>
											<li><span style="color:rgb(255, 97, 97);">·  </span>이메일 : <span>${recruit.email}</span></li>
											<li><span style="color:rgb(255, 97, 97);">·  </span>연락처 : <span>${recruit.phone}</span></li>
										</ul>
									</div>

										<!-- 신청하기 버튼 -->
										<div style="margin-bottom:70px;">
											<div class="btn-frame" style="text-align: center;">
												<button class="btn" onclick="add()" style="width:200px; height:60px;">신청하기</button>
											</div>
										</div>
									</div>

									<hr>
									<div style="float:right;">
										<button style="padding: 10px 20px; color: gray; background: #f2f2f2; border-radius: 4px; border: none; font-weight:bold; font-size: 15px; height: 40px; width: 80px;" id="listBrn" onclick="list()">목록</button>
									</div>

<%-- 								<ul class="dropdown">
								<c:choose>
									<c:when test="${principal.user.loginAuth eq 'ADMIN' }">
										<li><a href="/admin/adminmain">관리자페이지</a></li>
									</c:when>
									<c:when test="${principal.user.loginAuth eq 'MANAGER' }">
										<li><a href="/manager/updateState?groupSeq=${principal.user.memSeq}">단체마이페이지</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="/user/main">마이페이지</a></li>
									</c:otherwise>
								</c:choose>
								</ul>
 --%>


								</div>
							</div>
		
						</div>
		
					</div>
				</div>
			</div>
<!-- 			</form> -->
			
		</div>
	</div>
	</div>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=259b6e4c0775108f360aa1e89a7a9d32"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(${recruit.latitude}, ${recruit.longitude}), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${recruit.latitude}, ${recruit.longitude}); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
	</script>
	
	<script>
    	function list() {
    		location.href = "<c:url value='/recruit/list'/>"; 
    	}
    </script>
	
	<script>
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

	  var targetDate = new Date("${recruit.recruitStartDate}");
	  var dday = calculateDday(targetDate);

	  document.getElementById("ddayElement").innerHTML = dday;



	$(document).ready(function() {
	    // 페이지 로딩 시에 비교 및 처리
	    checkAndHandleRecruitmentCompletion();
	});

	function checkAndHandleRecruitmentCompletion() {
	    // 모집인원 값을 가져옵니다.
	    var count = $("#MEM_COUNT").val();

	    // 실제모집인원 값을 가져옵니다.
	    var realCount = $("#COUNT").val();

	    // count와 realCount 값을 비교하여 같으면 처리합니다.
	    if (count == realCount) {
	        // 버튼 텍스트를 "신청 완료"로 변경합니다.
	        $(".btn").text("모집완료");

	        // 버튼을 비활성화합니다.
	        $(".btn").prop("disabled", true);
	    }
	}
	
	function add() {
	    
	    const recruitSeq = $("#RECRUIT_SEQ").val();
	    const memSeq = ${principal.user.memSeq};
	    const groupMemSeq = $("#GROUP_MEM_SEQ").val();
	    
        console.log("recruitSeq : " + recruitSeq);
        console.log("memSeq : " + memSeq);
        console.log("groupMemSeq : " + groupMemSeq);
        
	    const param = {
	            recruitSeq: recruitSeq,
	            memSeq: memSeq,
	            groupMemSeq: groupMemSeq
	        };
	        
	        console.log("recruitSeq2 : " + recruitSeq);
	        console.log("memSeq2 : " + memSeq);
	        console.log("groupMemSeq2 : " + groupMemSeq);

	        fetch("<c:url value='/recruit/add'/>", {
	            method: "POST",
	            headers: {
	                "Content-Type": "application/json; charset=UTF-8",
	            },
	            body: JSON.stringify(param)
	        })
	        .then(response => response.json())
	        .then(data => {
	            // 수정: 중괄호와 괄호를 맞춤
	            if (data.status) {
	                alert(data.message);
	            } else {
	            	alert(data.message);
	            }
	        });
	    }
	 
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