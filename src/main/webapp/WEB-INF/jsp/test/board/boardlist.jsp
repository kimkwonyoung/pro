<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
	<div id="container">
		<div class="tit_box">
			<h2><span class="cate">게시판 테스트</span></h2>
		</div>
	<form id="form1" action="<c:url value='boardlist.do'/>">
		<div class="content">
			<div class="col-4">
				<div class="m10">
					<div class="nor_ser_box">
						<p class="inline">
						</p>
						<p class="inline mL30">
							<select name="type1" class="searchType" >
								<option value="title">제목</option>
								<option value="mem_id">작성자</option>
							</select>
							<label>검색</label>
							
							<input type="text" name="searchWord" class="input_txt mL10" style="width:120px;">
							<a class="btn_ser" id="search"><span>검색</span></a>
						</p>
					</div><!-- nor_ser_box -->
					<div class="aright mT20">
					<a href="" class="btn_m_gline"><span class="reg">글쓰기</span></a>
					</div>
					<div class="scroll mT10" style="max-height:660px; margin-bottom:20px;">
						<table class="imp_list">
							<colgroup>
								<col width="20%"><col width="*"><col width="13%"><col width="11%"><col width="9%">
							</colgroup>
							<thead>
								<tr>
									<th>글번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
								</tr>
							</thead>
							<tbody>
								
 <c:forEach var="board" items="${list}">
        <tr>
          <td>${board.boardNum }</td>
          <td style="text-align: left;">
          <span style="padding-left:${(board.level-1) * 20}px"></span>
          ${board.level != 1 ? "[답변] " : ""}
          <a href="#" onclick="info(${board.boardNum}, 'board')">${board.title}</a>
          </td>
          <td>${board.memId }</td>
          <td>${board.modDate }</td>
          <td>${board.viewCount }</td>
        </tr>
</c:forEach>
							</tbody>
						</table>
					</div><!-- scroll -->
					<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
				</div><!-- mT10 -->
			</div><!-- left_cons col-6 -->
			<div class="col-6">
				<div class="m10">
				</div><!-- m10 -->
			</div><!-- right_cons -->
		</div><!-- contents_end col-4 -->
	</form>
	</div>
</div>
<script type="text/javascript">
$("#search").on("click", function(){
	$("#form1").submit();
})
</script>
</body>
</html>