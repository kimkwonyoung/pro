<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
	<%@ include file="/WEB-INF/jsp/include/sidebar.jsp"%> 

    <input type="hidden" id="pageName" value="review">

      <!-- Page content wrapper-->
      <div class="col-md-10 col-lg-9 col-xl-10" id="page-content-wrapper">

            <!-- Page content-->
            <div class="container-fluid">
               <div class="row" style="width: 1100px;">


            <div class="row posts-entry mt-2" style="margin-bottom: 2rem;">
               <div class="col-lg-10" style="text-align: right;">
  		         <div class="d-flex justify-content-between">
		             <div class="form-check">
		                 <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		                 <label class="form-check-label" for="flexCheckDefault"></label>
		                 전체 선택
		             </div>
                
                     <div class="btn btn-secondary my-2 my-sm-0 ms-auto" style="width: 5rem;">
                        삭제
                     </div>
      		     </div>
               </div>

               <c:forEach var="review" items="${list}">
                <div class="col-lg-8">
                  <div class="blog-entry d-flex blog-entry-search-item" style="display: flex; align-items: center;">
       				<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						<label class="form-check-label" for="flexCheckDefault"></label>
					</div>
                     <a href="single.html" class="img-link me-4">
                        <img src="images/img_1_sq.jpg" alt="Image" class="img-fluid"> <!-- 이미지 시퀀스 어케 넣지  -->
                     </a>
                     <div>
                        <span class="date">${review.regDate}</span>
                        <h2><a href="single.html">${review.reviewTitle}/a></h2>
                        <p>${review.reviewContent}</p>
                     </div>
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
</html>