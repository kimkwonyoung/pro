<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
	<%@ include file="/WEB-INF/jsp/include/sidebar.jsp"%> 
    
    <input type="hidden" id="pageName" value="finish">
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

					<c:forEach var="finished" items="${list}">
						<div class="blog-entry d-flex blog-entry-search-item" style="align-items: center !important;">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
								<label class="form-check-label" for="flexCheckDefault"></label>
							</div>
							<div style="flex-grow: 1; margin-left: 1rem;">
							<div>
								봉사기간: <span class="date" style="margin-right: 5rem !important;">${finished.volunStartDate } ~ ${finished.volunEndDate }</span>
								<p style="margin:0;">단체이름: ${finished.groupName }</p>
								<h2 style="display: inline-block;"><a href="/recruit/detail?recruitSeq=${finished.recruitSeq }">${finished.recruitTitle }</a></h2>
								<div class="btn-container" style="float: right; display: inline-block;">
									<a href="/review/writeForm?recruitSeq=${finished.recruitSeq }"><div class="btn btn-secondary my-2 my-sm-0"> 후기<br>쓰기</div></a>
									<div class="btn btn-secondary my-2 my-sm-0"> 평가<br>하기</div>
								</div>
							</div>		
							
							</div>
						</div>
					</c:forEach>
					
					<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
                    </div>
			</div>




            </div>

      </div>
   
<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>   