<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


   <div class="d-flex" id="wrapper">
      <!-- Sidebar-->
      <div class="col-md-2 col-lg-3 col-xl-2 border-end bg-white" id="sidebar-wrapper" style="
    margin-bottom: 50px;
    border-bottom: 1px solid #dee2e6;">
            <div class="list-group list-group-flush">
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">마이 페이지</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">신청 글 작성</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">신청 목록/ 승인 및 거절</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">진행 중인 봉사</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">봉사활동 후기글</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">캘린더 관리</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">개인 정보 및 프로필 수정</a>
         </div>
      </div>
      <!-- Page content wrapper-->
      <div>

         <div class="section search-result-wrap">
            <div class="container" style="margin-left : 10%;">
               <br>
               <br>
               <div class="search_section">
                  <form>
                     <div class="form-css">
                        <br>
      
                     <div class="inner3">
                     <div class="inner4">
                        <div>
                           <div class="inner-detail-wrap">
                              <div class="inner-detail">
                                 <div>
                                    <br>
      
                                    <!-- 글번호 히든처리 -->
                                    <input type="hidden" value="글번호~~">
      
                                    <table class="table-register">
                                       <tr>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사기간</th>
                                          <td><span><input type="date"  class="form-keyword"></span>~<span><input type="date"  class="form-keyword"></span></td>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사분야</th>
                                          <td>
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
                                          </td>
                                       </tr>
                                       <tr>
                                          <!-- 봉사단체는 로그인한 닉네임 바로가져올거임 -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사단체</th>
                                          <!-- ${loginMember.nickname} -->
                                          <td>혜화불주먹해적단</td>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사시간</th>
                                          <td><span><input type="time" class="form-keyword"></span>~<span><input type="time" class="form-keyword"></span></td>
                                          <input type="hidden"  class="form-keyword" value="">
                                       </tr>
      
                                          <!-- 봉사지역 -->
                                       <tr>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사지역</th>
                                          <td>
                                             <div class="search_boxes">
                                                <div class="search_box">
                                                   <select class="form-select" onchange="categoryChange(this)">
                                                      <option value>시/도 선택</option>
                                                      <option value="general01">강원</option>
                                                      <option value="general02">경기</option>
                                                      <option value="general03">경남</option>
                                                      <option value="general04">경북</option>
                                                      <option value="general05">광주</option>
                                                      <option value="general06">대구</option>
                                                      <option value="general07">대전</option>
                                                      <option value="general08">부산</option>
                                                      <option value="general09">서울</option>
                                                      <option value="general10">울산</option>
                                                      <option value="general11">인천</option>
                                                      <option value="general12">전남</option>
                                                      <option value="general13">전북</option>
                                                      <option value="general14">제주</option>
                                                      <option value="general15">충남</option>
                                                      <option value="general16">충북</option>
                                                   </select>
                                                   <select class="form-select" name="" id="state">
                                                      <option>군/구 선택</option>
                                                   </select>
                                                </div>
                                             </div>
      
                                          </td>
                                          <!-- 카카오지도로 출력 -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사장소</th>
                                          <td>혜화역</td>
                                       </tr>
      
                                       <tr>
                                          <!-- 봉사대상 -> 직접작성? -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사대상</th>
                                          <td><input type="text" class="form-keyword" value="부족한친구들"></td>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>필요인원</th>
                                          <td><input type="number"  class="form-keyword"></td>
                                       </tr>
      
      
                                       <tr>
                                          <!-- 모집기간  -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>모집기간</th>
                                          <td><span><input type="date" class="form-keyword"></span>~<span><input type="date" class="form-keyword"></span></td>
                                          <!-- ㅇㄹㅇㄴ -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>담당자</th>
                                          <td><input type="text" value="김권영"  class="form-keyword"></td>
                                       </tr>
      
                                       <tr>
                                          <!-- 모집기간  -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>연락처</th>
                                          <td><input type="text" value="010-2222-3333"  class="form-keyword"></td>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>이메일</th>
                                          <td><input type="text" value="ky90@naver.com"  class="form-keyword"></td>
                                       </tr>
                  
                                    </table>
      
                                    <br>
                                    <br>
      
                                    <div>
                                       <input type="text" value="제목 " class="form-keyword" placeholder="제목" style="width: 100%; height: 40px;">
                                       <!-- 상세 내용 -->
                                       <br>
                                       <br>
                                       <div class="contents-frame">
                                          <textarea name="contents" id="contents" placeholder="내용" style="border-radius: 4px;"></textarea>
                                       </div>
                                    </div>
                                    <br>
                                    <br>
                                    <!-- 신청하기 버튼 -->
                                    <div class="btn-frame">
                                       <button class="btn" type="submit">등록</button>
                                       <button class="btn">취소</button>
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

            

      </div>
   </div>
	
<script>


  /* 위지윅 적용 */
        ClassicEditor
              .create(document.querySelector('#contents'))
              .catch(error=>{
                    console.error(error);
              });

</script> 
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/tiny-slider.js"></script>

<script src="js/flatpickr.min.js"></script>


<script src="js/aos.js"></script>
<script src="js/glightbox.min.js"></script>
<script src="js/navbar.js"></script>
<script src="js/counter.js"></script>
<script src="js/custom.js"></script>

  <!-- kakaoMap SDK -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf4c86bc1723d426212a3db32e5953d6"></script>
  <script>
  ////////////// 지도 표시 api //////////////
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
              center: new kakao.maps.LatLng(37.583719781699365, 126.99995471354192), // 지도의 중심좌표
              level: 2 // 지도의 확대 레벨
        };

  // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption); 


  ////////////// 지도 이동 api //////////////
  function setCenter() {            
        // 이동할 위도 경도 위치를 생성합니다 
        var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
        
        // 지도 중심을 이동 시킵니다
        map.setCenter(moveLatLon);
  }

  function panTo() {
        // 이동할 위도 경도 위치를 생성합니다 
        var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
        
        // 지도 중심을 부드럽게 이동시킵니다
        // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
        map.panTo(moveLatLon);            
  } 

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
  // 지도를 클릭한 위치에 표출할 마커입니다
  var marker = new kakao.maps.Marker({ 
        // 지도 중심좌표에 마커를 생성합니다 
        position: map.getCenter() 
  }); 
  // 지도에 마커를 표시합니다
  marker.setMap(map);

  // 지도에 클릭 이벤트를 등록합니다
  // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
        
        // 클릭한 위도, 경도 정보를 가져옵니다 
        var latlng = mouseEvent.latLng; 
        
        // 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);
        
        var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
        message += '경도는 ' + latlng.getLng() + ' 입니다';
        
        var resultDiv = document.getElementById('clickLatlng'); 
        resultDiv.innerHTML = message;
        
        
  });
  </script>

  <!-- fullCalendar API -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
  <script>

     document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
           initialView: 'dayGridMonth',
           contentHeight: 448 ,
           //aspectRatio: 5// 기본값 : 1.35 | Type : Float
                                 // 너비가 높이의 두 배
           
        });
        calendar.render();
     });

  </script>

  <!-- 함수 호출용 JS -->
  <script>
     document.getElementById("currentTime").innerHTML = Date();
  </script>    

<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>

