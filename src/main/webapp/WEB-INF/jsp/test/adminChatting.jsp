<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/js/test/chat.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/js/test/matt.js"></script>
<script src="/js/test/mattAdmin.js"></script>
<script src="/js/test/mattClient.js"></script>
</head>
<body>


<div class="wrap_chat_main">
	<ul id="chatList">
	</ul>
	<footer>
		<textarea placeholder="Type your message"  id="chatInputBox"></textarea>
		<select id="seatSelector">
		  <option selected>좌석번호</option>
		</select>
		<a href="javascript:void(0);" id="send_chat_button">Send</a>
	</footer>
</div>
</body>
</html>
