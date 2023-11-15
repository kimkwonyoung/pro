<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<%@ include file="/WEB-INF/jsp/include/top.jsp"%> 
	<%@ include file="/WEB-INF/jsp/include/sidebar.jsp"%> 

    <input type="hidden" id="pageName" value="main">
    
      <!-- Page content wrapper-->
      <div class="col-md-10 col-lg-9 col-xl-10" id="page-content-wrapper" style="margin-top: 1rem;">

            <!-- Page content-->
            <div class="container-fluid">
               <div class="row" style="width: 1300px; height: 16rem; margin-bottom: 2rem;">
                  <div class="col-md-2">
                     <img src="images/person_1.jpg" class="img-fluid" alt="프로필 사진" style="width:100%; margin-bottom:1rem !important;">

                     <div class="col-md-2border" style="margin: 0;"><i class="bi bi-thermometer-high"></i>${temperature.volunHeat}</div>
                 </div>
                  <div class="col-md-6">
                     <div class="border">
                        <div style="height: 16rem;">
                           <div class="blog-entry d-flex blog-entry-search-item">
                              <!-- <a href="single.html" class="img-link me-4">
                                 <img src="images/img_1_sq.jpg" alt="Image" class="img-fluid" style="10rem !important">
                              </a> -->
                              <div class="col-md-12">
	                              <span class="date ms-5"> 오늘의 봉사 </span>
	                              <span class="date float-end me-5" id="mypageDate" ></span>
                                  <div class="ms-2 my-3 d-flex align-items-center">
	                              		<h2 id="volunProceedTitle" onclick="changeMapCenter()">${todayProceed.recruitTitle}</h2>
                       		     	    <button class="btn btn-primary ms-2" onclick="changeMapCenter()">센터 찾기</button>
   									    <button class="btn btn-secondary ms-2" onclick="changeMapUser()">현재 위치로</button>
	                              		
                              	  </div>

                              </div>
                           </div>
                        </div>
                     </div>.
                  </div>
                  <div class="col-md-3 border d-flex align-items-center">
                     <p class="text-md-start">
	                     <div>
	               	        <div>오늘의 봉사 온도</div>
							<i class="bi bi-thermometer-high"></i>${temperature.volunHeat}
	                     	<div>축하드려요</div>
	                     	<div>내일의 봉사 온도</div>
	                     </div>

                     </p>
                  </div>
               </div>

                  <div class="row" style="width:1300px; margin-bottom: 2rem;" >
                     <div class="col-md-11" >
                     <ul class="nav nav-pills nav-fill">
                        <li class="nav-item border rounded-2">
                          <a class="nav-link active" data-toggle="tab" href="#mapTab">지도</a>
                        </li>
                        <li class="nav-item border rounded-2">
                          <a class="nav-link" data-toggle="tab" href="#calendarTab">내 일정</a>
                        </li>
                      </ul>
                      <div class="tab-content">
                        <div class="tab-pane fade show active" id="mapTab">
                           <div class="border">
                              <div>

                              </div>               
                              <div class="row" style="" >
                                 <div class="col-md-8">
                                    <div id="map" style="width:100%;height:25rem;"></div>
                                 </div>
                              
                                 <div class="col-md-4" >
                                    <div class="card" style="width: 100%; height: 8rem; margin-bottom: 1rem !important;">
                                       <div class="card-body">
                                          <h5 class="card-title"><i class="bi bi-clock"></i> IN</h5>
                                          <p class="card-text" id="arrivalDateTime" style="text-align:right">날짜 및 시간</p>
                                          <p class="card-text" id="arrival" style="text-align:right">${timeinout.timein}</p>
                                       </div>
                                    </div>
            
                                    <div class="card" style="width: 100%; height: 8rem; margin-bottom: 1rem !important;">
                                       <div class="card-body">
                                          <h5 class="card-title"><i class="bi bi-clock"></i> OUT</h5>
                                          <p class="card-text" id="departureDateTime" style="text-align:right">날짜 및 시간</p>
                                          <p class="card-text" id="departure" style="text-align:right">${timeinout.timeout }</p>
                                       </div>
                                    </div>
            
                                    <div class="btn btn-secondary my-2 my-sm-0" id="btnTimeRecord" style="width:100%; height: 7rem;">
                                       <p> 시간 기록 버튼 : <div id="currentTime"> </div> </p>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="tab-pane fade" id="calendarTab">
                           <div class="card" style="width: 100%;">
                              <div class="card-body">
                                 <h5 class="card-title">내 일정</h5>
                                 <div id='calendar'></div>
   
                              </div>
                           </div>
                        </div>
                      </div>
                     </div>
                  </div>

                  <div class="row" style="width:100%; margin-bottom: 2rem;" >
                     <div class="col-md-9">
                        


                     </div>

                  </div>

            </div>

      </div>
   </div>
   
	<!-- 오늘의 봉사 좌표 획득용 hidden input 태그 -->
	<input type="hidden" id="latitude" value="${todayProceed.latitude}">
	<input type="hidden" id="longitude" value="${todayProceed.longitude}">

    <!-- 	마이 페이지 날짜 획득용JS -->
	<script>
	function getKoreanDate() {
	   const now = new Date();
	   const options = {
	       timeZone: 'Asia/Seoul',
	       year: 'numeric',
	       month: '2-digit',
	       day: '2-digit'
	   };
	   const koreanDate = now.toLocaleString('ko-KR', options);
	   return koreanDate;
	}
	
	document.getElementById('mypageDate').textContent = getKoreanDate();
	
	// 시간 기록 버튼 내용 바꾸기 함수
	// 페이지 로드 시 실행
    window.onload = function () {
        // 데이터 업데이트 함수 호출
        updateArrivalDeparture();
    };



	</script>


 
      <!-- 거리계산용 JS -->
      <script src='https://unpkg.com/@turf/turf@6.3.0/turf.min.js'></script>
      <script src='/js/map/distance.js'></script>
      <!-- kakaoMap SDK -->
      <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=08d20e40da94696ee7b9ff3a47add144"></script>
      <script>
      

      ////////////// 지도 표시 api //////////////
      // 금일 봉사의 좌표를 동적으로 받아오기 위해 좌표 선언
      // 금일 봉사 없을 땐 지도가 깨짐
   	  var latitude = document.getElementById('latitude').value;
  	  var longitude = document.getElementById('longitude').value;
    
      var volunLocPosition = new kakao.maps.LatLng(latitude, longitude); // 진행 중인 봉사 제목 누르면 이동하기 위한 함수용 변수

  	  
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
//                  center: new kakao.maps.LatLng(37.29297, 127.0486), // 지도의 중심좌표 광교 좌표
                  center: new kakao.maps.LatLng(parseFloat(latitude), parseFloat(longitude)), // 지도 좌표 동적 처리
//                  center: new kakao.maps.LatLng(37.61625, 127.0656), // 지도의 중심좌표 석계 좌표

                  level: 4 // 지도의 확대 레벨
            };
      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption); 


      ////////////// 지도 확대 툴바 api //////////////
      // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
      var mapTypeControl = new kakao.maps.MapTypeControl();

      // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
      // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

      // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);





      ////////////// 지도 클릭 시 마커 및 좌표 획득 api //////////////
      // 지도 중심좌표에 마커를 생성합니다
      var marker2 = new kakao.maps.Marker({ 
            // 지도 중심좌표에 마커를 생성합니다 
            position: map.getCenter()
      }); 

      // 지도에 마커를 표시합니다
      marker2.setMap(map);



      var locPosition;
      // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
      if (navigator.geolocation) {

         // GeoLocation을 이용해서 접속 위치를 얻어옵니다
         var coord1 = navigator.geolocation.getCurrentPosition(function(position) {

            var userlat = position.coords.latitude; // 위도
            var userlon = position.coords.longitude; // 경도

          console.log("사용자 위치[위도] " + userlat);
          console.log("사용자 위치[경도] -> " + userlon);

         const gpsInfo =  getInfo();

//            console.log("gpsInfo -> " + gpsInfo);
//            console.log("gpsInfo.center -> " + gpsInfo.center);
//            console.log("gpsInfo.center.lat -> " + gpsInfo.center.lat);
//            console.log("gpsInfo.center.lng -> " + gpsInfo.center.lng);
          
         // 이부분에서 거리 계산하면 됨

         const coord1 = [userlon, userlat];
         const coord2 = [gpsInfo.center.lng, gpsInfo.center.lat];
         
/*          console.log("coord1의 값을 보자 "+coord1); */


      //////////////////////turf.js를 사용했을 때의 코드
        // 두 지점 간의 거리를 계산합니다.
      //   const options = { units: 'meters' }; // 거리의 단위를 미터로 설정합니다.
      //   const distance = turf.distance(coord11, coord2, options);
        

      ///////////////////////////////////turf.js 관련 내용을 함수화해 만든 distance.js를 사용했을 때의 코드
        const distance = calculateDistance(coord1, coord2);

        console.log('두 지점 사이의 거리는 약 '+ distance +'미터입니다.');

        // 거리에 따라 버튼 눌렀을 때 버튼 활성화/비활성화
//        if (distance <= 100) { // 의도대로 짠 거리 로직
        if (distance <= 10000000) { // GPS 오차가 너무 심함; 모바일에서도 해봐야 할 듯
           document.getElementById('btnTimeRecord').classList.add('btn-secondary');
           document.getElementById('btnTimeRecord').classList.remove('btn-gray');
           // 들어올 때 함수 돌리고
           attendCheck();
           } else {
           document.getElementById('btnTimeRecord').classList.remove('btn-secondary');
           document.getElementById('btnTimeRecord').classList.add('btn-gray');
           // 나갈 때 함수 돌리면
           finishCheck();
           }
        
      
//             console.log("if문 안에 함수 안에 userlon"+userlon);
             locPosition = new kakao.maps.LatLng(userlat, userlon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
             message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
            
            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);

/*
			console.log("현재 접속 위도입니다. userlat : "+userlat);
            console.log("현재 접속 경도입니다. userlon : "+userlon);
 */            

            });

         
      } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
         
         var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
            message = 'geolocation을 사용할수 없어요..'
            
         displayMarker(locPosition, message);
      }

      ////////////////////////////////////////카카오맵 API 지도 관련 함수 시작/////////////////////////////////////////

      // 지도에 마커와 인포윈도우를 표시하는 함수입니다
      function displayMarker(locPosition, message) {

         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({  
            map: map, 
            position: locPosition
         }); 
         
         var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

         // 인포윈도우를 생성합니다
         var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
         });
         
         // 인포윈도우를 마커위에 표시합니다 
         infowindow.open(map, marker);
         
         // 지도 중심좌표를 접속위치로 변경합니다
         map.setCenter(locPosition);      
      }  

      
      
      
      
	  // 봉사활동 센터 위치 얻기 위한 함수
      function getInfo() {
         // 지도의 현재 중심좌표를 얻어옵니다 
         var center = map.getCenter(); 
         
         // 지도의 현재 레벨을 얻어옵니다
         var level = map.getLevel();
         
         // 지도타입을 얻어옵니다
         var mapTypeId = map.getMapTypeId(); 
         
         // 지도의 현재 영역을 얻어옵니다 
         var bounds = map.getBounds();

         // 영역의 남서쪽 좌표를 얻어옵니다 
         var swLatLng = bounds.getSouthWest(); 

         // 영역의 북동쪽 좌표를 얻어옵니다 
         var neLatLng = bounds.getNorthEast(); 

         // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
         var boundsStr = bounds.toString();


         var message = '봉사활동 위치 좌표는 위도 ' + center.getLat() + ', <br>';
         message += '경도 ' + center.getLng() + '이고 <br>';
         // message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
         // message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
         // message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
         // message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';         
         // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
         // ex) console.log(message);
         console.log(message);

       return {
         center : {lat : center.getLat(), lng : center.getLng()},
         bounds : bounds
       }
      }
      
      // 봉사 제목 누르면 센터로 지도 중심 이동 구현할 함수
      function changeMapCenter(){
		map.setCenter(volunLocPosition);
     }
     
     // 봉사 제목 한 번 더 누르면 현재 위치로 지도 중심 이동할 함수
     	function changeMapUser(){
   		 map.setCenter(locPosition);
   		 console.log(locPosition);
     }
     

     ////////////////////////////////////////카카오맵 API 지도 관련 함수 끝/////////////////////////////////////////
     
     
     /////////////////////////////////////////////////////// 출석 체크 버튼 관련 함수 시작 ///////////////////////////////////
      
      // 출석 체크 했을 때 백엔드와 통신하기 위한 함수
      function attendCheck() {
          // 서버에 출석 체크 요청을 보내는 비동기 요청
          fetch('<c:url value="/user/attend" />')
              .then(response => {
                  if (!response.ok) {
                      throw new Error('서버 오류');
                  }
                  return response.json();
              })
              .then(data => {
                  console.log('출석 체크 성공:', data);
              })
              .catch(error => {
                  console.error('이미 출근 처리 됐습니다.', error);
                  // 에러 발생 시 사용자에게 메시지 표시 등의 처리
              });
      }
      function finishCheck() {
          // 서버에 출석 체크 요청을 보내는 비동기 요청
          fetch('<c:url value="/user/recordUpdate" />')
              .then(response => {
                  if (!response.ok) {
                      throw new Error('서버 오류');
                  }
                  return response.json();
              })
              .then(data => {
                  console.log('퇴근 체크 성공:', data);
              })
              .catch(error => {
                  console.error('이미 퇴근 처리가 됐습니다.', error);
                  // 에러 발생 시 사용자에게 메시지 표시 등의 처리
              });
      }
      
      
      
      // 버튼 클릭 시 시간 기록 및 출석 체크
      document.getElementById('btnTimeRecord').addEventListener('click', async function() {
          if (this.classList.contains('btn-secondary')) {
              if (document.getElementById('arrival').textContent.trim() === '') {
                  document.getElementById('arrival').textContent = await getKoreanStandardTime();
                  // 시간 기록 후 출석 체크 함수 호출
                  attendCheck();
                  Swal.fire({
                      title: "도착 인증 되었습니다!",
                      html: `
                      오시느라 고생 많으셨습니다!
                      `,
                      showCancelButton: false,
                      confirmButtonText: "확인",
                  })
              } else {
                  if (document.getElementById('departure').textContent.trim() === '') {
                      document.getElementById('departure').textContent = await getKoreanStandardTime();
                  	// 시간 기록 후 퇴근 체크 함수 호출
                     finishCheck();
                     Swal.fire({
                         title: "퇴근 인증 되었습니다!",
                         html: `
                         오늘도 수고하셨습니다.<br>보람찬 봉사, 감사합니다!
                         `,
                         showCancelButton: false,
                         confirmButtonText: "확인",
                     })
                  }
              }

          }
      });
      
      
      
      

      // sysdate를 한국 표준시로 얻기
      async function getKoreanStandardTime() {
          const now = new Date();
          const koreanDate = now.toLocaleString('ko-KR', { timeZone: 'Asia/Seoul' });
          return koreanDate;
      }
    

      // 데이터가 있는지 확인하고 적절한 내용으로 변경하는 함수
      function updateArrivalDeparture() {
          const arrivalElement = document.getElementById('arrival');
          const departureElement = document.getElementById('departure');

          const arrivalDataTimeElement = document.getElementById('arrivalDateTime');
          const departureDataTimeElement = document.getElementById('departureDateTime');

          // Arrival 데이터가 있으면 업데이트, 없으면 기본값으로 유지
          if (arrivalElement.innerText.trim() != '') {
              arrivalDataTimeElement.innerHTML = '출석하셨습니다. 고맙습니다!';
              arrivalElement.innerHTML = '보람찬 봉사, 감사합니다! <i class="bi bi-thermometer"></i>';
          }

          // Departure 데이터가 있으면 업데이트, 없으면 기본값으로 유지
          if (departureElement.innerText.trim() !== '') {
              departureDataTimeElement.innerHTML = '끝마쳤습니다. 고맙습니다!';
              departureElement.innerHTML = '덕분에 더 따뜻해졌어요! <i class="bi bi-thermometer-sun"></i>';
          }
      }
      /////////////////////////////////////////////////////// 출석 체크 버튼 관련 함수 끝 ///////////////////////////////////


      </script>


      
    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>


    <!-- FullCalendar JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js" crossorigin="anonymous"></script>



      <script> 
         // 변수 선언
         var calendar;
         var event;
 
         // FullCalendar 초기화
         $(document).ready(function () {
             calendar = $('#calendar').fullCalendar({
                 // FullCalendar 옵션 설정
                 header: {
                     left: 'prev,next today',
                     center: 'title',
                     right: 'month,agendaWeek,agendaDay'
                 },
                 navLinks: true,
                 selectable: true,
                 selectHelper: true,
                 editable: true,
                 eventLimit: true,
                 contentHeight: 410,
                 
 
                 // 이벤트 클릭 이벤트 처리
                 eventClick: function (calEvent, jsEvent, view) {
                     event = calEvent;
                     $('#inputTitle').val(calEvent.title);
                     $('#eventModalLabel').text('Edit Event');
                     $('#eventModal').modal('show');
                 },
 
                 // 날짜 클릭 이벤트 처리
                 dayClick: function (date, jsEvent, view) {
                     event = null;
                     $('#inputTitle').val('');
                     $('#eventModalLabel').text('New Event');
                     $('#eventModal').modal('show');
                 },
             });
         });
 
         // 이벤트 생성 및 수정 함수 추가
         function saveEvent() {
             var title = $('#inputTitle').val();
 
             if (title) {
                 var eventData = {
                     title: title,
                     start: event ? event.start : $('#calendar').fullCalendar('getDate'),
                     end: event ? event.end : null,
                 };
 
                 if (event) {
                     // 이벤트 수정
                     event.title = title;
                     $('#calendar').fullCalendar('updateEvent', event);
                 } else {
                     // 이벤트 생성
                     $('#calendar').fullCalendar('renderEvent', eventData, true);
                 }
                 $('#eventModal').modal('hide');
             } else {
                 alert('Title is required');
             }
         }
     </script>

      <!-- 탭 만들기 부트스트랩 링크 -->
      <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
      <!-- 마이 페이지 날짜 기록 함수 호출용 JS -->
      <script>
         document.getElementById("currentTime").innerHTML = Date();
      </script>

	<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%> 
