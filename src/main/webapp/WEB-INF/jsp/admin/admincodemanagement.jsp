<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/jsp/include/admintop.jsp"%>

 <!--  코드 관리 바디 시작  -->
<div class="management-container">
	<div class="management-actions">
		<div class="management-search">
			<select class="management-select" id="managementCategory">
				<option value="title">그룹코드</option>
				<option value="author">코드번호</option>
				<option value="content">코드이름</option>
			</select> <input type="text" id="inquiryInput" class="search-input"
				placeholder="검색...">
			<button class="search-btn">검색</button>
		</div>
	</div>
</div>


<!-- Content Start -->
<div class="container">
	<div class="row-cols-1">
		<div class="row row-cols-1 row-cols-md-3 g-4" style="height: 570px;">
			<!-- 대분류 카드 -->
			<div class="col" style="width: 70%;">
				<div class="card h-100">
					<div class="card-body">
						<h5 class="card-title">코드 관리</h5>
						그룹 코드 : 
							<select class="management-select" id="selectBoxCode">
							<c:forEach var="code" items="${groupCode }">
								<option value="${code.codeGroup }">${code.codeGroup }</option>
							</c:forEach>
							</select>
						<ul class="list-group" style="margin-top:20px; max-height:570px; overflow-y: auto;">
							
							<li class="list-group-item d-flex justify-content-between align-items-center" >
							
							
								<table class="table" >
								<thead>
									<tr>
										<th>그룹 코드</th>
										<th>코드 번호</th>
										<th>코드 이름</th>
										<th>코드 설명</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody id="codeList">
								</tbody>
								</table>
							</li>
							
						</ul>
					</div>
				</div>
			</div>
			<div class="col" style="width: 30%;">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">코드 추가 / 수정</h5>
						<ul class="list-group">
							<!-- 리스트 아이템 -->
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<span>그룹 코드 : 
									<input type="text" id="group-code">
								</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<span>코드 번호 : 
									<input type="text" id="group-number">
								</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<span>코드 이름 : 
									<input type="text" id="group-name">
								</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<span>코드 설명 : 
									<input type="text" id="group-detail">
								</span>
								<input type="hidden" id="group-hidden" value="">
							</li>
							
							<!-- 리스트 아이템 -->
						</ul>
					</div>
					<div class="card-footer mt-auto">
						<button class="btn btn-primary" id="code-insert">추가/수정</button>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<script id="codeGroupListTemplate" type="text/x-jsrender">
<tr id="deleterow{{:codeNumber}}">
	<td>{{:codeGroup }}</td>
	<td>{{:codeNumber }}</td>
	<td>{{:codeName }}</td>
	<td>{{:codeDetail }}</td>
	<td>
		<div>
			<button class="btn btn-sm btn-primary me-2" onclick="updateCode('{{:codeGroup}}', '{{:codeNumber }}', '{{:codeName }}', '{{:codeDetail }}', {{:codeSeq}})">수정</button>
			<button class="btn btn-sm btn-danger" onclick="deleteCode('{{:codeGroup}}', '{{:codeNumber }}')">삭제</button>
		</div>
	</td>
</tr>

</script>

<script>
$(document).ready(function () {
    showCodeGroupData();

    $("#selectBoxCode").on("change", () => {
        var selectedOption = $("#selectBoxCode").find("option:selected");
        console.log("바꾼 셀렉트 값 = " + selectedOption.val());
        showCodeGroupData(selectedOption.val());
    });
    
    $("#code-insert").on("click", () => {
    	const param = {
    		codeGroup:	$("#group-code").val(),
    		codeNumber:	$("#group-number").val(),
    		codeName:	$("#group-name").val(),
    		codeDetail:	$("#group-detail").val(),
    		codeSeq: $("#group-hidden").val()
    	}
        $.ajax({
            url: "/admin/codesave",
            type: "POST",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(param),
            dataType: "json",
            success: function (json) {
                console.log(json.result);
                const codeData = json.result;
                const codeTemplate = $("#codeGroupListTemplate").html();
                const tmpl = $.templates(codeTemplate);
                const renderedcode = tmpl.render(codeData);
                $("#codeList").empty();
                $("#codeList").append(renderedcode);
                $("#group-code").val("");
            	$("#group-number").val("");
            	$("#group-name").val("");
            	$("#group-detail").val("");
            	$("#group-hidden").val("");
            }
        });
    	
    });

    function showCodeGroupData(selectedValue) {
        $.ajax({
            url: "/admin/codegroup",
            type: "POST",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify({groupCode: selectedValue}),
            dataType: "json",
            success: function (json) {
                console.log(json.result);
                const codeData = json.result;
                const codeTemplate = $("#codeGroupListTemplate").html();
                const tmpl = $.templates(codeTemplate);
                const renderedcode = tmpl.render(codeData);
                $("#codeList").empty();
                $("#codeList").append(renderedcode);
            }
        });
    }
    
    $("#selectBoxCode").val($("#selectBoxCode option:first").val()).change();
});



function updateCode(codeGroup, codeNumber, codeName, codeDetail, codeSeq) {
	$("#group-code").val(codeGroup);
	$("#group-number").val(codeNumber);
	$("#group-name").val(codeName);
	$("#group-detail").val(codeDetail);
	$("#group-hidden").val(codeSeq);
}

function deleteCode(codeGroup, codeNumber) {
	console.log("데이터 = " + codeGroup + ", " + codeNumber);
	$.ajax({
        url: "/admin/deletecode",
        type: "POST",
        contentType: "application/json; charset=UTF-8",
        data: JSON.stringify({codeGroup: codeGroup, codeNumber: codeNumber }),
        dataType: "json",
        success: function (json) {
        	Swal.fire({
        		   title: '정말로 삭제 하시겠습니까?',
        		   icon: 'warning',
        		   showCancelButton: true, 
        		   confirmButtonColor: '#3085d6', 
        		   cancelButtonColor: '#d33', 
        		   confirmButtonText: '삭제',
        		   cancelButtonText: '취소', 
        		   reverseButtons: true, // 버튼 순서 거꾸로
        		   
        		}).then(result => {
        		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
        		      Swal.fire('삭제가 완료 되었습니다.');
        		      $("#deleterow" + codeNumber).remove();
        		   }
        		});
    	}
	});
}
</script>

<%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>

