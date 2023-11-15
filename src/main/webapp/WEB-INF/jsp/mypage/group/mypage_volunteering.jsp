<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<div class="d-flex" id="wrapper">
      <!-- Sidebar-->
      <div>
        <div class="list-group list-group-flush">
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/main?groupSeq=${principal.user.memSeq}">마이 페이지</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/recruit/registerForm">신청 글 작성</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/updateState?groupSeq=${principal.user.memSeq}">신청 목록/ 승인 및 거절</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/volunteeringList?groupSeq=${principal.user.memSeq}">진행 중인 봉사</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/review?groupSeq=${principal.user.memSeq}">봉사활동 후기글</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/calendar?groupSeq=${principal.user.memSeq}"">캘린더 관리</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/profile?groupSeq=${principal.user.memSeq}">개인 정보 및 프로필 수정</a>
         </div>
      </div>
      <!-- Page content wrapper-->
      <div style="width:80%;">

         <div class="kanban-board">
            <div class="column" id="details-map-column">
			    <h2 style="color: black; font-size: 25px; font-weight: bold;">봉사활동 정보</h2>
			    <div id="volunteer-details">
			        <!-- 봉사활동 정보 표시 -->
			        <h1 style="color: black; font-size: 30px; font-weight: bold; margin-top:50px;">${recruit.recruitTitle}</h1>
			        <p><strong>글번호:</strong>${recruit.recruitSeq}</p>
			        <p><strong>봉사단체: </strong>${recruit.groupName}</p>
			        <p><strong>봉사기간: </strong>${recruit.volunStartDate} ~ ${recruit.volunEndDate}</p>
			        <p><strong>봉사장소: </strong>${recruit.volunAddr}</p>
			        <p><strong>모집인원: </strong>${recruit.count}명 / ${recruit.memCount}명</p>
			    </div>
			    

			    <div class="map">
					<div id="map" style="width:100%;height:350px;"></div>
				</div>
			</div>

    
    

            <div class="column" id="attendees-column">
                <h2 style="color: black; font-size: 25px; font-weight: bold;">봉사자 목록</h2>
                <div class="volunteer-attendees" style="margin-top:50px;">
					<table>
					    <tr>
					        <th>회원번호</th>
					        <th>이름</th>
					        <th>승인여부</th>
					        <th>출석여부</th>
					    </tr>
					
					    <c:forEach items="${volunteer}" var="volunteer">
					        <tr>
					            <td>${volunteer.memSeq}</td>
					            <td>${volunteer.name}</td>
					            <td>${volunteer.state}</td>
					            <td>${volunteer.attendance}</td>
					        </tr>
 					    </c:forEach>
					</table>

                </div>
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

    <scrpit></scrpit>