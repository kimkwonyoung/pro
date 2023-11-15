<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Kanit:200" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="/css/error/font-awesome.min.css" />
	<link type="text/css" rel="stylesheet" href="/css/error/style.css" />
</head>
<body>

	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1>${statusCode}</h1>
			</div>
			<h2>${message }</h2>
			<h2>${messageEng }</h2>
			<p>현재 페이지는 동작 하지 않습니다. 관리자에게 문의 하세요. </p>
			<a href="/">Return Home</a>
		</div>
	</div>
</body>
</html>
	
		
    
