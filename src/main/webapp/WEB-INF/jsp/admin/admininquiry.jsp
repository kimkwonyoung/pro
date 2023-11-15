<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/jsp/include/admintop.jsp"%>
   <link href="/admintemplate/css/admininquiry.css" rel="stylesheet">
<!--  고객문의 시작 -->

           <!-- 고객센터 검색 -->
           <div class="inquiry-container">
               <div class="inquiry-actions">
                   <div class="inquiry-search">
                    <span>고객문의</span> <!-- '고객문의' 텍스트 추가 -->
                    <select class="inquiry-select" id="inquiryCategory">
                        <option value="title">전체</option>
                        <option value="author">미답변</option>
                        <option value="content">답변완료</option>
                    </select>
                    <input type="text" id="inquiryInput" class="search-input" placeholder="검색...">
                    <button class="search-btn">검색</button>
                </div>
            </div>
        </div>
        
        
                        <!-- 첫 번째 줄: 기간 선택 및 빠른 기간 선택 버튼들 -->
                <div class="inquirysearch-bar">
                    <div class="inquiry-date-selection">
                        <label class="inquiry-label" for="dateRange">기간:</label>
                        <input type="checkbox" class="date-toggle" id="dateRangeToggle">
                        <input type="date" class="date-input" id="startDate" name="startDate" value="2022-02-26">
                        <span class="date-separator">~</span>
                        <input type="date" class="date-input" id="endDate" name="endDate" value="2022-05-26">

                        <button class="date-btn">오늘</button>
                        <button class="date-btn">1주일</button>
                        <button class="date-btn">1개월</button>
                        <button class="date-btn">3개월</button>
                        <button class="date-btn">6개월</button>
                        <button class="date-btn">전체</button>
                    </div>

                            
                    <div class="inquiry-selection">
                        <label class="inquiry-label" for="inquiryType">문의유형:</label>
                        <select class="inquiry-select" id="inquiryType" name="inquiryType">
                            <option>전체</option>
                            <option>봉사문의</option>
                            <option>개인문의</option>
                            <option>단체문의</option>
                        </select>

                        <label class="inquiry-label" for="status">상태:</label>
                        <select class="inquiry-select" id="status" name="status">
                            <option>미답변</option>
                            <option>답변완료</option>
                            <option>전체</option>
                        </select>
                    </div>
                </div>

                    <!-- 세 번째 줄: 검색 및 초기화 버튼 -->
                    <div class="inquiry-searchbtn">
                        <button class="btn btn-primary me-2">검색</button>
                        <button class="btn btn-secondary">초기화</button>
                    </div>

                            
                            <!--  공지사항 내용... -->
                            <!-- 아래 문의 목록 -->
                            <div class="container">

                                <!-- 왼쪽 패널: 리스트 출력 -->
                                <div class="left-panel">
                                    <div class="list-item" onclick="showDetails('item1')">항목 1</div>
                                    <div class="list-item" onclick="showDetails('item2')">항목 2</div>
                                    <div class="list-item" onclick="showDetails('item3')">항목 3</div>
                                </div>

                                <!-- 오른쪽 패널: 상세보기 -->
                                <div class="right-panel">
                                    <div id="details">
                                        <!-- 선택된 리스트 아이템의 상세 정보 표시 -->
                                        
                                    </div>
                                </div>
                        
                            </div>
        
        
<%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>

