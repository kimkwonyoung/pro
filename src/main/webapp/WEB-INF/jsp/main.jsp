<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ include file="/WEB-INF/jsp/include/top.jsp"%>



<a href="<c:url value='boardlist.do'/>">게시판 테스트</a><br/>

<s:message code="success.request.msg" /><br/>
<c:forEach var="test" items="${testlist }">
<span>${test.testNum }</span>
<span>${test.title }</span>
<span>${test.testName }</span>
<br/>

</c:forEach>






</body>
</html>