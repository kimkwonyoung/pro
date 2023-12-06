<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
	<%@ include file="/WEB-INF/jsp/include/sidebar.jsp"%> 
    
    <input type="hidden" id="pageName" value="list">
    
<!-- Page content wrapper-->
      <div class="col-md-10 col-lg-9 col-xl-10 ms-3 mt-4" id="page-content-wrapper">

            <!-- Page content-->
            <div class="container-fluid">
               <div class="row" style="width: 1100px;">
               </div>





                <div class="row posts-entry" style="margin-bottom: 2rem;">
                
                    <div class="col-lg-10" style="text-align: right;">
 						<%@ include file="/WEB-INF/jsp/include/searchformList.jsp"%>  
<%-- 						<%@ include file="/WEB-INF/jsp/include/searchformStar.jsp"%>  --%>
                    </div>

                    <div class="col-lg-10" style="min-height:712px">

						<c:forEach var="recruit" items="${list}">
			             <div class="blog-entry d-flex blog-entry-search-item" style="display: flex; align-items: center;">
			               <div style="flex-grow: 1; ">
			               	   <span><button type="button" class="btn btn-primary recruitLink" style="color: #7f7b7b; font-weight:800; background-color: #f2f2f2; border:transparent;">${recruit.state}</button></span>
						            <c:if test="${not empty recruit.rejectMessage}">
						                <span><button type="button" class="btn btn-primary" style="color: #7f7b7b; font-weight:800; background-color: #f2f2f2 ; border:transparent;">${recruit.rejectMessage}</button></span>
						            </c:if>
			               	   <span><button type="button" class="btn btn-warning" style="font-weight:800; background-color: #fbeb6c; border:transparent;">${recruit.recruitEndDate}</button></span>
			                   <h2><a href="/recruit/detail?recruitSeq=${recruit.recruitSeq }"">${recruit.recruitTitle}</a></h2>
			                   <span class="date me-2">봉사 기간 : ${recruit.volunStartDate} ~ ${recruit.volunEndDate}</span>
			                   <span class="me-2">모집 기관 : ${recruit.groupName}</span>
			               </div>
			             </div>
						</c:forEach>




<!-- 
                        <div class="row text-start pt-5 border-top">
                            <div class="col-md-12">
                                <div class="custom-pagination">
                                    <span>1</span>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#">4</a>
                                    <span>...</span>
                                    <a href="#">15</a>
                                </div>
                            </div>
                        </div>
 -->
                    </div>

					<!-- 권형 페이징 -->
					 <div class="col-lg-10">
 						<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
 					</div>
			</div>




            </div>

      </div>
   </div>
   
<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>   

  </body>
  <script>
  var recruitState${status.index} = "${recruit.recruitState}";

  var recruitLink${status.index} = document.getElementById("recruitLink${status.index}");

  if (recruitState${status.index} === '모집완료') {
    recruitLink${status.index}.style.backgroundColor = 'red';
  }

  
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

	
    // 문서가 로드된 후 실행되는 함수
    document.addEventListener("DOMContentLoaded", function() {
        // 모든 클래스가 "recruitLink"인 요소들을 선택
        var recruitLinks = document.querySelectorAll('.recruitLink');

        // 각 링크에 대해 반복
        recruitLinks.forEach(function(link) {
            // 해당 요소의 텍스트 값이 "모집중"인 경우
            if (link.innerText.trim() === "승인") {
                // 링크의 텍스트 색상을 변경하여 흰색으로 설정
                link.style.color = 'white';
                // 링크의 배경색을 변경하여 원하는 색상으로 설정
                link.style.backgroundColor = '#3ab41cb5';
            }
        });
    });
  </script>
</html>