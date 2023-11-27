<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
	<%@ include file="/WEB-INF/jsp/include/sidebar.jsp"%> 
    
    <input type="hidden" id="pageName" value="list">
    
<!-- Page content wrapper-->
      <div class="col-md-10 col-lg-9 col-xl-10" id="page-content-wrapper">

            <!-- Page content-->
            <div class="container-fluid">
               <div class="row" style="width: 1100px;">
               </div>





                <div class="row posts-entry" style="margin-bottom: 2rem;">
                
                    <div class="col-lg-10" style="text-align: right;">
						<%@ include file="/WEB-INF/jsp/include/searchformTemplate.jsp"%> 
                    </div>

                    <div class="col-lg-10">
<!--                     
			             <div class="blog-entry d-flex blog-entry-search-item" style="display: flex; align-items: center;">
			               <div style="flex-grow: 1; margin-left: 1rem;">
			               	   <span><button type="button" class="btn btn-primary">신청 중</button></span>
			               	   <span><button type="button" class="btn btn-warning">D-3</button></span>
			                   <h2><a href="single.html">1번째 샘플? 부트스트랩 : 테두리 컴포넌트 적용</a></h2>
			                   <span class="me-2">신청 인원 : 0/10</span><span class="date me-2">봉사 기간 : Apr. 14th, 2022</span><span class="me-2">모집 기관 : 바우와 주간보호센터</span>
			                   <div class="d-flex justify-content-between align-items-center">
			                       <div>
			                           <p style="margin-bottom: 0;">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
			                       </div>
			                   </div>
			               </div>
			             </div>
 -->
						<c:forEach var="recruit" items="${list}">
			             <div class="blog-entry d-flex blog-entry-search-item" style="display: flex; align-items: center;">
			               <div style="flex-grow: 1; margin-left: 1rem;">
			               	   <span><button type="button" class="btn btn-primary">${recruit.state}</button></span>
			               	   <span><button type="button" class="btn btn-warning">${recruit.recruitEndDate}</button></span>
			                   <h2><a href="single.html">${recruit.recruitTitle}</a></h2>
			                   <span class="date me-2">봉사 기간 : ${recruit.volunStartDate} ~ ${recruit.volunEndDate}</span>
			                   <span class="me-2">모집 기관 : ${recruit.groupName}</span>
			               </div>
			             </div>
						</c:forEach>




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

  </script>
</html>