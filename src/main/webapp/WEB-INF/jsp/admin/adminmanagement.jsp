<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<%@ include file="/WEB-INF/jsp/include/adminfixpage.jsp"%>
<!-- Chart Start -->
<div class="container-fluid mt-3">
  <div class="row">
      <div class="col-md-10">
          <div class="member-management-box">
              <div class="d-flex justify-content-between align-items-center">
                  <h4>회원관리</h4>
              </div>
          </div>
      </div>
         <!-- 검색 & 필터 & 버튼 -->
           <!-- 고객센터 검색 -->
           <div class="management-container">
            <div class="management-actions">
                <div class="management-search">
                 <select class="management-select" id="managementCategory">
                     <option value="title">전체</option>
                     <option value="author">회원</option>
                     <option value="content">단체</option>
                 </select>
                 <input type="text" id="inquiryInput" class="search-input" placeholder="검색...">
                 <button class="search-btn">검색</button>
             </div>
         </div>
     </div>


<!-- 쪽지 전송 & 일괄 제재 버튼 -->
<!-- <div class="mt-2 d-flex justify-content-end">
  <button class="btn btn-primary active-button" id="messageButton">쪽지 전송</button>
  <button class="btn btn-primary" id="sanctionButton">일괄 제재</button>
</div> -->


          <!-- 테이블 -->
          <div class="mt-4 center-right-container">
              <div class="mb-3 d-flex align-items-center">
                  <label for="member-type-filter" class="form-label me-2" style="display:none">회원/단체 구분</label>
                  <button class="btn btn-primary me-2">개인</button>
                  <button class="btn btn-secondary">단체</button>
              </div>
              <div class="mt-2 d-flex justify-content-end">
                <!-- 쪽지 전송 & 일괄 제재 버튼 -->
                <button class="btn btn-primary active-button" id="messageButton">쪽지 전송</button>
                <button class="btn btn-primary" id="sanctionButton">일괄 제재</button>
        
                <!-- 정렬 드롭다운 -->
                <div class="dropdown">
                    <button class="btn btn-primary active-button dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        정렬
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">이름 순</a>
                        <a class="dropdown-item" href="#">등록 순</a>
                    </div>
                </div>
            </div>
            </div>

      </div>
          
              <style>
                  #member-table th:first-child, 
                  #member-table td:first-child {
                      border-left: none;
                  }
              
                  #member-table th:last-child, 
                  #member-table td:last-child {
                      border-right: none;
                  }
              </style>
              
              <table class="table table-bordered" id="member-table">
                  <thead>
                      <tr>
                          <th>번호</th>
                          <th>이름</th>
                          <th>이메일</th>
                          <th>회원 타입</th>
                          <th>봉사 시간</th>
                          <th>온도</th>
                          <th>상태</th>
                          <th>비고</th>
                      </tr>
                  </thead>
                  <tbody></tbody>
              </table>
              
          
          <!-- 페이지네이션 -->
          <div class="d-flex justify-content-center mt-4">
              <button class="btn btn-light">
                  <i class="bi bi-arrow-left"></i>
              </button>                
              <button class="btn btn-light">1</button>
              <button class="btn btn-light">2</button>
              <button class="btn btn-light">3</button>
              <button class="btn btn-light">4</button>
              <button class="btn btn-light">10</button>
              <button class="btn btn-light">
                  <i class="bi bi-arrow-right"></i>
              </button>
              
          </div>
      </div>
  </div>
</div>

</body>
</html>