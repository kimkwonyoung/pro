<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="form1" action="" method="post">
	 <table class="nor_write">
			<colgroup>
				<col width="10%" />
				<col width="90%" />
			</colgroup>
			
			<tbody>
			 
				<tr>
					<th>글제목</th>
					<td><input type="text" name=""></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>글쓴사람(로그인한사람)</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						
						<textarea name="body" cols="" rows="" id="body" style="width:95%; height:538px;" class="editor">${vo.body }</textarea>
						<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>" charset="utf-8"></script>
						<script type="text/javascript" src="<c:url value='/ckeditor/config.js'/>" charset="utf-8"></script>
				
						<script type="text/javascript">
							CKEDITOR.replace('body', {
								width : '98%'
								, height : '500px'
								, startupFocus : false
							});
						</script>
					</td>
				</tr>
			</tbody>
			
		</table>
		<div class="btn_wrp">
			<a href="" class="btn_b_grey">목록으로</a>
			<a href="" class="btn_b_blue">삭제</a>
			<a href="" class="btn_b_blue">저장</a>
		</div>
</form>
		
<script type="text/javascript">
	$(function() {
		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;
			switch (dialogName) {
				case 'image': //Image Properties dialog
					//dialogDefinition.removeContents('info');
					dialogDefinition.removeContents('Link');
					dialogDefinition.removeContents('advanced');
					break;
			}
		});
	});
	
	
	function doSubmit() {
			
		if (!confirm("저장하시겠습니까?"))
			return;
	
		var sBody = CKEDITOR.instances.body.getData();
		$('textarea[name=body]').val(sBody);
		$('#form1').submit();
			

	}
	
</script>


