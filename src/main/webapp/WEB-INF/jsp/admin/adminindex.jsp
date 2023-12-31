<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>     --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <title>관리자페이지</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- 즐겨찾기아이콘 -->
    <link href="img/favicon.ico" rel="icon">

    <!-- 구글 웹 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/admintemplate/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/admintemplate/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/admintemplate/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/admintemplate/css/adminstyle.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
               <a href="<c:url value='adminmain'/>" class="navbar-brand mx-4 mb-3">
					<div style="width: 290px; height: 50px; background: #F3F6F9;">
						<img src="/admintemplate/img/volunteeradmin.png" alt="관리자 페이지 로고"
							style="width: 100%; height: 100%;" />
					</div>
				</a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
   <img class="rounded-circle" src="/admintemplate/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">관리자</h6>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="<c:url value='adminmain'/>" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <div class="nav-item dropdown">
                        <a href="<c:url value='adminmanagement'/>" class="nav-link dropdown-toggle1"><i class="fa fa-laptop me-2"></i>단체/회원관리</a>
                    </div>
                    <a href="<c:url value='adminnotice'/>" class="nav-item nav-link"><i class="fa fa-th me-2"></i>공지사항</a>
                    <a href="<c:url value='adminboard'/>" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>게시판</a>
                    <a href="<c:url value='admininquiry'/>" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>고객문의</a>
                    <a href="<c:url value='admincodemanagement'/>" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>카테고리 관리</a>
                </div>                  
            </nav>
        </div>
        <!-- Sidebar End -->

        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="<c:url value='adminmain'/>" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="navbar-nav align-items-center ms-auto">
                    
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="/admintemplate/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex">관리자</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="<c:url value='/'/>" class="dropdown-item">메인홈으로 </a>       
                            <a href="<c:url value='/logout'/>" class="dropdown-item">로그아웃</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->


            <!-- 방문자 보여지는 곳 -->
            <div class="container-fluid pt-4 px-4"  style="padding: 0;">              
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4" >
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-0">하루 방문자</p>
                                <h6 class="mb-0">24명</h6>
                            </div>
                        </div>
                    </div>
            </div>
            <!-- Sale & Revenue End -->


            <!-- 차트 시작 부분 -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                     <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4 text-center" style= "height:475px;">
                            <h6 class="mb-4">월 단위 주최 봉사</h6>
                            <canvas id="bar-chart"></canvas>
                        </div>
                    </div>
                 	<div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4 text-center">
                            <h6 class="mb-4">봉사 활동 유형별 분포</h6>
                            <canvas id="doughnut-chart" width="567" height="565" style="display: block; margin: 0px auto; box-sizing: border-box; height: 376.667px; width: 378px;"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sales Chart End -->

            <!--  인기 후기글  -->
            <div class="container-fluid pt-4 px-4">
        <div class="bg-light text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
    <div style="flex: 1;"></div> <!-- 왼쪽 빈 공간 -->
    <h6 class="mb-0" style="flex: 2; text-align: center;">후기 게시글 TOP 5</h6>
    <div style="flex: 1;"></div> <!-- 오른쪽 빈 공간 -->
</div>
            <div class="table-responsive">
                <table class="table text-start align-middle table-bordered table-hover mb-0">
                    <thead>
                        <tr class="text-dark">
                            <th scope="col" class="text-center">제목</th>
					        <th scope="col" class="text-center">작성자</th>
					        <th scope="col" class="text-center">작성일</th>
					        <th scope="col" class="text-center">조회수</th>
					        <th scope="col" class="text-center">추천수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${top5Reviews}" var="review">
                            <tr>
							    <td class=""><c:url var="reviewDetailUrl" value="/review/info">
								<c:param name="reviewSeq" value="${review.reviewSeq}" />
								</c:url> <a href="${reviewDetailUrl}">${review.reviewTitle}</a></td>
								<td class="text-center">${review.writeId}</td>
					            <td class="text-center">${review.regDate}</td>
					            <td class="text-end">${review.viewCount}</td>
					            <td class="text-end">${review.recomCount}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

            <!-- Widgets Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="h-100 bg-light rounded p-4">
                            <div class="d-flex align-items-center justify-content-center mb-4">
							    <h6 class="mb-0">일정표</h6>
							</div>
                            <div id="calender"></div>
                        </div>
                    </div>
					<div class="col-sm-12 col-md-6 col-xl-8">
						<div class="h-100 bg-light rounded p-4">
							<div
								class="d-flex align-items-center justify-content-center mb-4">
								<h6 class="mb-0">오늘의 업무</h6>
							</div>

							<div class="d-flex mb-2">
								<input id="taskInput" class="form-control bg-transparent"
									type="text" placeholder="업무를 입력하세요">
								<button id="addTaskButton" type="button"
									class="btn btn-primary ms-2">+</button>
							</div>
							<div id="taskList" class="task-list">
								<!-- 할 일 목록이 여기에 추가됩니다 -->
							</div>
						</div>
					</div>



<!-- 					<div class="d-flex mb-2"> -->
<!--                                 <input class="form-control bg-transparent" type="text" placeholder="업무를 입력하세요"> -->
<!--                                 <button type="button" class="btn btn-primary ms-2">+</button> -->
<!--                             </div> -->

<!--                             <div class="d-flex align-items-center pt-2"> -->
<!--                                 <input class="form-check-input m-0" type="checkbox"> -->
<!--                                 <div class="w-100 ms-3"> -->
<!--                                     <div class="d-flex w-100 align-items-center justify-content-between"> -->
<!--                                         <span>공지사항 등록하기</span> -->
<!--                                         <button class="btn btn-sm"><i class="fa fa-times"></i></button> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            <!-- Widgets End -->


            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="<c:url value='/'/>">volunteer</a>, All Right Reserved. 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/admintemplate/lib/chart/chart.min.js"></script>
    <script src="/admintemplate/lib/easing/easing.min.js"></script>
    <script src="/admintemplate/lib/waypoints/waypoints.min.js"></script>
    <script src="/admintemplate/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/admintemplate/lib/tempusdominus/js/moment.min.js"></script>
    <script src="/admintemplate/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="/admintemplate/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="/admintemplate/js/main.js"></script>
    <script src="/admintemplate/js/chart.js"></script>
</body>

<script>
    document.getElementById('addTaskButton').addEventListener('click', function() {
        var task = document.getElementById('taskInput').value;
        if (task) {
            addTask(task);
            document.getElementById('taskInput').value = '';
        }
    });

    function addTask(task) {
        var taskList = document.getElementById('taskList');
        var taskDiv = document.createElement('div');
        taskDiv.classList.add('d-flex', 'align-items-center', 'pt-2');

        var checkBox = document.createElement('input');
        checkBox.classList.add('form-check-input', 'm-0');
        checkBox.type = 'checkbox';

        var taskContentDiv = document.createElement('div');
        taskContentDiv.classList.add('w-100', 'ms-3');

        var taskContentInnerDiv = document.createElement('div');
        taskContentInnerDiv.classList.add('d-flex', 'w-100', 'align-items-center', 'justify-content-between');

        var taskSpan = document.createElement('span');
        taskSpan.textContent = task;

        var deleteButton = document.createElement('button');
        deleteButton.classList.add('btn', 'btn-sm');
        deleteButton.innerHTML = '<i class="fa fa-times"></i>';
        deleteButton.addEventListener('click', function() {
            taskList.removeChild(taskDiv);
        });

        taskContentInnerDiv.appendChild(taskSpan);
        taskContentInnerDiv.appendChild(deleteButton);

        taskContentDiv.appendChild(taskContentInnerDiv);

        taskDiv.appendChild(checkBox);
        taskDiv.appendChild(taskContentDiv);

        taskList.appendChild(taskDiv);
    }
</script>

</html>