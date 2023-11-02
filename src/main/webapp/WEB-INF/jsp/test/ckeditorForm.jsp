<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/top.jsp"%>

<style>
.ck.ck-editor {
	width: 80%;
	max-width: 800px;
	margin: 0 auto;
}

.ck-editor__editable {
	height: 80vh;
}
</style>
</head>

<body>

	<div>
		<form id="mForm" method="post">			
			<input type="hidden" id="tableName" name="tableName" value="${tableName }">
			<textarea id="editor" name="editor"></textarea><br/>
			<input type="submit" value="Upload" />
		</form>
	</div>

<script>		
	let editor;
	ClassicEditor
	.create(document.querySelector('#editor'),{
		ckfinder: {
			uploadUrl : '/imageUpload?token=${token}'
		}
	})
	.then(editor => {
		console.log('Editor was initialized');
		window.editor = editor;
	})
	.catch(error => {
		console.error(error);
	});
	
	
	document.querySelector('#mForm').addEventListener("submit", e => {
		e.preventDefault();
		
		fetch("/ckeditorWrite", {
			method: "POST",
			headers: {
			    "Content-Type": "application/json",
			},
			body: JSON.stringify({
				token: '${token}',
				editor: document.querySelector("#editor").value,
				tableName: document.querySelector("#tableName").value
			}),
		})
		.then(response => response.json())
		.then(result => console.log(result));
		
		return false;
	});
	
 </script>
 
</body>
</html>