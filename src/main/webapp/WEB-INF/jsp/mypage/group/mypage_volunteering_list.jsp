<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="d-flex" id="wrapper">
      <!-- Sidebar-->
      <div>
        <div class="list-group list-group-flush">
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/main?groupSeq=${principal.user.memSeq}">마이 페이지</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/recruit/registerForm">신청 글 작성</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/registerList?groupSeq=${principal.user.memSeq}">신청 글 목록</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/updateState?groupSeq=${principal.user.memSeq}">신청 목록/ 승인 및 거절</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/volunteeringList?groupSeq=${principal.user.memSeq}">진행 중인 봉사</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/review?groupSeq=${principal.user.memSeq}">봉사활동 후기글</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/calendar?groupSeq=${principal.user.memSeq}">캘린더 관리</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/profile?groupSeq=${principal.user.memSeq}">개인 정보 및 프로필 수정</a>
         </div>
      </div>
      <div style="width:80%;">
<!-- 			<div style="display: flex; justify-content: center;">
				<div style="width:75%;"> -->
				<br>

					<input type="hidden" id="GROUP_MEM_SEQ" name="groupMemSeq" value="${principal.user.memSeq}">
					<div class="inner1">
						<div class="inner2">
							<div class="row posts-entry">
								<div class="sss" style="margin-bottom:150px;">
								
									<p style="font-size:30px;"><img src="/images/list4.png" style="width:26px;">   오늘의 봉사활동</p>
									<hr>
									<div style="width: 100%;">
										<c:forEach var="today" items="${today}">
										<div class="blog-entry d-flex blog-entry-search-item" style="margin-bottom:100px;">
											<div>
<%-- 												<p>글번호 : ${today.recruitSeq}</p> --%>
												<p class="title" style="margin-bottom:5px; font-weight:bold;"><a href="/manager/volunteering?recruitSeq=${today.recruitSeq}">${today.recruitTitle}</a></p>


												<div>
													<div class="data clear">
									
															<dl>
															<dt>모집기간:</dt>
																<dd><span>${today.recruitStartDate}</span>~<span>${today.recruitEndDate}</span></dd>
															</dl>
															<dl>
																<dt>봉사기간:</dt>
																<dd><span>${today.volunStartDate}</span>~<span>${today.volunEndDate}</span></dd>
															</dl>
			
													</div>
												</div>
											</div>
										</div>
										</c:forEach>
									</div>
									
									
									<p style="font-size:30px;"><img src="/images/list4.png" style="width:26px;">   다가오는 봉사활동</p>
									<hr>								
									<c:forEach var="withinAWeek" items="${withinAWeek}">
									<div class="blog-entry d-flex blog-entry-search-item" style="margin-bottom:100px;">
										<div>
											<p>글번호 : ${withinAWeek.recruitSeq}</p>
											<p class="title"><a href="/manager/volunteering?recruitSeq=${withinAWeek.recruitSeq}">${withinAWeek.recruitTitle}</a></p>
											
											<div>
												<div class="data clear">
														<dl>
															<dt>신청/필요인원:</dt>
															<dd>
																<span>${withinAWeek.count}</span>/<span>${withinAWeek.memCount}</span>
															</dd>
														</dl>
															<dl>
															<dt>모집기간:</dt>
																<dd><span>${withinAWeek.recruitStartDate}</span>~<span>${withinAWeek.recruitEndDate}</span></dd>
															</dl>														
														<dl>
															<dt>봉사기간:</dt>
															<dd><span>${withinAWeek.volunStartDate}</span>~<span>${withinAWeek.volunEndDate}</span></dd>
														</dl>
		
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									
		
		
		
								
									
					
								</div>
							</div>
						</div>
		
						<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
					</div>
	</div>
	</div>

<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>