<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/jsp/include/admintop.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

   <!-- 검색 & 필터 & 버튼 -->
           <!-- 고객센터 검색 -->
		<div class="adminboard-container">
			<div class="adminboard-actions">
				<div class="adminboard-search">
					<form id="searchForm" class="management-search" action="" method="get">
						<select class="adminboard-select" name="type1" id="managementCategory">
							<option value="TopField" >전체게시판</option>
							<option value="Recuritboard">모집게시판</option>
							<option value="Reviewboard">후기게시판</option>
						</select> 
						 <input type="text" name="searchWord" id="inquiryInput" class="search-input" placeholder="검색...">
						<button type="submit" class="search-btn">검색</button>
					</form>
				</div>
			</div>
		</div>
		
		
<div class="mb-3 d-flex align-items-center">
	<label for="member-type-filter" class="form-label me-2" style="display: none">봉사게시판 구분</label>
	<button class="btn btn-primary me-2" id="recruitButton">모집 게시판 </button>
	<button class="btn btn-secondary" id="reviewButton">후기 게시판</button>
</div>

		            <!-- 모집 게시판 리스트 출력 -->
		<div class="container mt-4" id="recruitTableContainer">
		    <table class="table">
		        <thead>
		            <tr>
		           		<th scope="col"><input type="checkbox" id="selectAll" onclick="selectAllCheckboxes()"></th>
		                <th scope="col">번호</th>
		                <th scope="col">제목</th>
		                <th scope="col">작성자</th>
		                <th scope="col">작성일</th>
		                <th scope="col">모집 상태</th>
		                <th scope="col">참여 인원</th>
		                <th scope="col">모집 마감일</th>
		                <th scope="col">비고</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="recruit" items="${list}" varStatus="status">
		                <tr>
		            		<td><input type="checkbox" name="selectRow" /></td>
		                    <td>${recruit.recruitSeq}</td>
		                    <td>${recruit.recruitTitle}</td>
		                    <td>${recruit.manager}</td>
		                    <td>${recruit.regDate}</td>
		                    <td>${recruit.recruitState}</td>
		                    <td>${recruit.memCount}</td>
		                    <td>${recruit.recruitEndDate}</td>
		                    <td>
		                        <button type="button" class="btn btn-info btn-sm">상세보기</button>
		                    </td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</div>
      
		      <!-- 후기 게시판 리스트 출력 -->
		<div class="container mt-4" id="reviewTableContainer">
		    <table class="table">
		        <thead>
		            <tr>
		            	
		            	<th scope="col"><input type="checkbox" id="selectAll" onclick="selectAllCheckboxesReview()"></th>
		                <th scope="col">후기번호</th>
		                <th scope="col">봉사번호</th>
		                <th scope="col">제목</th>
		                <th scope="col">작성자</th>
		                <th scope="col">작성일</th>
		                <th scope="col">좋아요 수</th>
		                <th scope="col">조회수</th>
		                <th scope="col">상태</th>
		                <th scope="col">비고</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="review" items="${groupmap.adminReviewList}" varStatus="status">
		                <tr>
		               	    <td><input type="checkbox" name="selectRow" /></td>
		                    <td>${review.reviewSeq}</td>
		                    <td>${review.recruitSeq}</td>
		                    <td>${review.reviewTitle}</td>
		                    <td>${review.writeId}</td>
		                    <td>${review.regDate}</td>
		                    <td>${review.recomCount}</td>
		                    <td>${review.viewCount}</td>
		                    <td>${review.delYn == 'N' ? '활성' : '비활성'}</td>
		                    <td>
		                        <!-- 여기에 필요한 버튼이나 추가 정보를 넣을 수 있습니다. -->
		                        <button type="button" class="btn btn-info btn-sm">상세보기</button>
		                    </td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</div>
      
                <!-- 선택한 항목을 삭제할 버튼 -->
            <!-- 선택한 항목을 삭제할 둥글게 디자인된 버튼 -->
            <button onclick="deleteRows()" class="btn btn-primary rounded">선택 항목 삭제</button>
            <%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>

            
            <script type="text/javascript">
            $(document).ready(function() {
                // 페이지 로드 시 리뷰 테이블 숨기기
                $('#reviewTableContainer').hide();

                // 모집 버튼 클릭 이벤트
                $('#recruitButton').click(function() {
                    $('#recruitTableContainer').show();
                    $('#reviewTableContainer').hide();
                });

                // 리뷰 버튼 클릭 이벤트
                $('#reviewButton').click(function() {
                    $('#recruitTableContainer').hide();
                    $('#reviewTableContainer').show();
                });

                // 모집 데이터 AJAX 호출
                $('#recruitButton').click(function() {
                    $.ajax({
                        url: '/admin/getRecruitBoard', // 모집 데이터를 가져오는 URL
                        type: 'GET',
                        dataType: 'json',
                        success: function(data) {
                            // 데이터를 성공적으로 받으면 테이블을 갱신합니다.
                            updateRecruitTable(data);
                        },
                        error: function() {
                            alert('모집 정보를 가져오는데 실패했습니다.');
                        }
                    });
                });

                // 리뷰 데이터 AJAX 호출
                $('#reviewButton').click(function() {
                    $.ajax({
                        url: '/admin/getReviewBoard', // 리뷰 데이터를 가져오는 URL
                        type: 'GET',
                        dataType: 'json',
                        success: function(data) {
                            // 데이터를 성공적으로 받으면 테이블을 갱신합니다.
                            updateReviewTable(data);
                        },
                        error: function() {
                            alert('리뷰 정보를 가져오는데 실패했습니다.');
                        }
                    });
                });

                // 모집 테이블 업데이트 함수
                function updateRecruitTable(recruits) {
                    var tableBody = $('#recruitTableContainer tbody');
                    tableBody.empty(); // 테이블의 기존 내용을 비웁니다.

                    // 받은 데이터로 테이블 내용을 채웁니다.
                    $.each(recruits, function(i, recruit) {
                        var row = '<tr>' +
                        '<td><input type="checkbox" name="selectRow" /></td>' + 
                        '<td>' + recruit.recruitSeq + '</td>' +
                        '<td>' + recruit.recruitTitle + '</td>' +
                        '<td>' + recruit.manager + '</td>' +
                        '<td>' + recruit.regDate + '</td>' +
                        '<td>' + recruit.recruitState + '</td>' +
                        '<td>' + recruit.memCount + '</td>' +
                        '<td>' + recruit.recruitEndDate + '</td>' +
                        '<td>'+'<button type="button" class="btn btn-info btn-sm">상세보기</button></td>' +
                        '</tr>';
                        tableBody.append(row);
                    });
                }

                // 리뷰 테이블 업데이트 함수
                function updateReviewTable(reviews) {
                    var tableBody = $('#reviewTableContainer tbody');
                    tableBody.empty(); // 테이블의 기존 내용을 비웁니다.

                    // 받은 데이터로 테이블 내용을 채웁니다.
                    $.each(reviews, function(i, review) {
                    	var activeStatus = review.delYn == 'N' ? '활성' : '비활성';
                        var row = '<tr>' +
                        '<td><input type="checkbox" name="selectRow" /></td>' + 
                        '<td>' + review.reviewSeq + '</td>' +
                        '<td>' + review.recruitSeq + '</td>' +
                        '<td>' + review.reviewTitle + '</td>' +
                        '<td>' + review.writeId + '</td>' +
                        '<td>' + review.regDate + '</td>' +
                        '<td>' + review.recomCount + '</td>' +
                        '<td>' + review.viewCount + '</td>' +
                        '<td>' + activeStatus + '</td>' +
                        '<td><button type="button" class="btn btn-info btn-sm">상세보기</button></td>' +
                        '</tr>';
                    tableBody.append(row);
                    });
                }
            });
            
            
                // 검색어에 따라 테이블 필터링 함수
//                 function filterTable() {
//                     var input = document.getElementById("searchInput");
//                     var filter = input.value.toLowerCase(); // 소문자로 변환
//                     var table = document.querySelector(".table");
//                     var tr = table.getElementsByTagName("tr");
                    
//                     for (var i = 1; i < tr.length; i++) {
//                         var td = tr[i].getElementsByTagName("td")[2]; // 제목 열
//                         if (td) {
//                             var txtValue = td.textContent || td.innerText;
//                             if (txtValue.toLowerCase().indexOf(filter) > -1) {
//                                 tr[i].style.display = "";
//                             } else {
//                                 tr[i].style.display = "none";
//                             }
//                         }
//                     }
//                 }
            
                // 모집 모든 체크박스 선택/해제 함수
                function selectAllCheckboxes() {
                    var checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
                    for (var i = 0; i < checkboxes.length; i++) {
                        checkboxes[i].checked = document.getElementById('selectAll').checked;
                    }
                }
                
                // 리뷰 모든 체크박스 선택/해제 함수
                function selectAllCheckboxesReview() {
                    var checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
                    console.log(checkboxes);
                    for (var i = 0; i < checkboxes.length; i++) {
                        checkboxes[i].checked = document.getElementById('selectAll').checked;
                    }
                }
            
            
                // 선택된 행 삭제 함수
                function deleteRows() {
                    var checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
                    for (var i = 0; i < checkboxes.length; i++) {
                        if (checkboxes[i].checked) {
                            checkboxes[i].closest('tr').remove();
                        }
                    }
                }
                
            </script>     
            
                   
<%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>

