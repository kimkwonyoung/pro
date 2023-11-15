<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->

<!-- </head> -->
<!-- <body> -->
<%@ include file="/WEB-INF/jsp/include/top.jsp"%>

	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header"/>	
		</div>
		<div id="content">
			<tiles:insertAttribute name="body"/>
		</div>		
	</div>
</body>
</html>