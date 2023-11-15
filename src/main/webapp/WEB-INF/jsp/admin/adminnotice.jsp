<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 <%@ include file="/WEB-INF/jsp/include/admintop.jsp"%>
       
          <!--공지사항 바디 리스트 -->
          <div class="notice-container">
            <div class="notice-actions">
                <div class="notice-search">
                    <select class="notice-select" name="type1" id="noticeCategory">
                        <option value="title">제목</option>
                        <option value="writeId">작성자</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord" id="noticeInput" class="search-input" placeholder="검색...">
               		<button type="submit" class="search-btn">검색</button>
                </div>
                <button class="new-notice-btn">새 공지사항 등록</button>
            </div>
            <!-- 기타 공지사항 내용... -->
        	</div>
        
         <!-- 정렬 영역 -->
          <!-- 상단 고정 및 삭제 버튼 -->
          <div class="button-group">
            <div class="manage-buttons">
                <button class="btn btn-primary m-2">상단 고정</button>
                <button class="btn btn-primary m-2">선택 삭제</button>
            </div>
            <div class="sort-area">
                <button class="btn btn-primary m-2">최신순</button>
                <button class="btn btn-primary m-2">조회순</button>
            </div>
        </div>
        
              <!-- 공지사항 목록 -->
          <div class="container mt-4" id="adminnoticeTableContainer">
		    <table class="table">
		        <thead>
		            <tr>
		            	<th><input type="checkbox" id="selectAll" onclick="noticeselectAllCheckboxes()"></th>
		                <th scope="col">공지번호</th>
		                <th scope="col">작성자</th>
		                <th scope="col">제목</th>
		                <th scope="col">등록일</th>
		                <th scope="col">수정일</th>
		                <th scope="col">조회수</th>
		                <th scope="col">고정여부</th>
		                <th scope="col">삭제이력</th>
		                <th scope="col">비고</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="notice" items="${adminnoticeList}" varStatus="status">
		                <tr>
			              <td><input type="checkbox"></td>
			              <th scope="row">${notice.noticeSeq}</th>
			              <td>${notice.writeId}</td>
			              <td>${notice.title}</td>
			              <td>${notice.regDate}</td>
			              <td>${notice.modDate}</td>
			              <td>${notice.viewCount}</td>
			              <td>${notice.pixedYn}</td>
			              <td>${notice.delYn eq 'N' ? 'Active' : 'Deleted'}</td>
			              <td></td>
			            </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</div>
 <%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
 <%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>

<script type="text/javascript">

// 모든 체크박스 선택/해제 함수
function noticeselectAllCheckboxes() {
    var checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = document.getElementById('selectAll').checked;
    }
}

</script>

