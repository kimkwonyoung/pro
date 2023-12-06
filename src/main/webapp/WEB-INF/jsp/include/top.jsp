<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>     --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="/template/favicon.png">

<!-- CDN방식 -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" > -->

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script> -->

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200&display=swap"
   rel="stylesheet">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<!-- <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;600;700&display=swap" rel="stylesheet">
 -->

<link rel="stylesheet" href="/template/fonts/icomoon/style.css">
<link rel="stylesheet" href="/template/fonts/flaticon/font/flaticon.css">



<link rel="stylesheet" href="/template/css/tiny-slider.css">
<link rel="stylesheet" href="/template/css/aos.css">
<link rel="stylesheet" href="/template/css/glightbox.min.css">
<link rel="stylesheet" href="/template/css/style.css">
<link rel="stylesheet" href="/template/css/flatpickr.min.css">
<!-- 새로 추가 되는 CSS -->
<link rel="stylesheet" href="/css/page/review.css">
<link rel="stylesheet" href="/css/page/user.css">
<!-- FullCalendar CSS -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />




<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- <script src="/js/common/jsrender.js"></script> -->
<!-- <script src="/js/common/jsviews.js"></script> -->
<!-- <script src="/js/common/jquery.locator.js"></script> -->
<script
   src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>


</head>
<body>
   <sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal" var="principal" />
   </sec:authorize>

<nav class="site-nav">
   <div class="container">
      <div class="menu-bg-wrap">
         <div class="site-navigation">
            <div class="row g-0 align-items-center">
               <div class="col-2">
                  <a href="/main" class="logo m-0 float-start">
                     <img src="/images/logo15.png" class="mb-2" style="width: 300px;">
                  </a>
               </div>
               <div class="col-8 text-center">

                     <ul
                        class="js-clone-nav d-none d-lg-inline-block text-start site-menu mx-auto">
                        <li class="active"><a href="/notice" style="font-size:22px;">공지사항</a></li>
                        <li><a href="category.html" style="color: #fff; font-size:22px;">봉사 안내</a></li>
                        <li><a href="/recruit/list" style="color: #fff; font-size:22px;">봉사 신청</a></li>
                        <li><a href="/review/list" style="color: #fff; font-size:22px;">봉사 후기</a></li>
                        <li><a href="category.html" style="color: #fff; font-size:22px;">고객센터</a></li>
                     </ul>
                  </div>

                  <div class="col-2 text-end">
                     <ul
                        class="js-clone-nav d-none d-lg-inline-block text-start site-menu mx-auto">
                        <c:if test="${empty principal }">
                           <div class="icon-container">
                              <a href="/auth/loginForm" style="color: white;"><i
                                 class="custom-icon fas fa-sign-in-alt login-icon"></i></a>
                           </div>
                        </c:if>
                        <c:if test="${!empty principal }">

                           <div class="icon-container me-4">
                              <c:choose>
                              <c:when test="${principal.user.loginAuth eq 'ADMIN' }">
                              </c:when>
                                 <c:when test="${principal.user.loginAuth eq 'MANAGER' }">
                                    <!-- 단체 관리자의 경우 채팅배너와 채팅방 링크 표시 -->
                                    <span class="notification-badge">Chat</span>
                                    <a href="/userchat/chatGroupRoom?groupMemSeq=${principal.user.memSeq}">
                                       <i class="icon-message"></i> </a>
                                 </c:when>
                                 <c:otherwise>
                                    <!-- 일반 사용자의 경우 채팅배너와 개인 채팅방 링크 표시 -->
                                    <a href="/userchat/chatRoom?memSeq=${principal.user.memSeq}">
                                    <span class="notification-badge">Chat</span>
                                       <i class="icon-message"></i>
                                    </a>
                                 </c:otherwise>
                              </c:choose>
                           </div>

                           <li class="has-children">
                              <div class="icon-container me-4">
                                 <a href="" style="color: white;"> <i
                                    class="custom-icon fas fa-user mypage"></i>
                                 </a>
                              </div>
                              <ul class="dropdown">
                                 <c:choose>
                                    <c:when test="${principal.user.loginAuth eq 'ADMIN' }">
                                    <li><a href="/admin/adminmain">관리자페이지</a></li>
                                    </c:when>
                                    <c:when test="${principal.user.loginAuth eq 'MANAGER' }">
                                       <li><a
                                          href="/manager/updateState?groupSeq=${principal.user.memSeq}">단체마이페이지</a></li>
                                    </c:when>
                                    <c:otherwise>
                                       <li><a href="/user/?memSeq=${principal.user.memSeq }">마이페이지</a></li>
                                    </c:otherwise>
                                 </c:choose>
                                 <li><a href="/logout">로그아웃</a></li>

                              </ul>
                           </li>
                        </c:if>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </nav>