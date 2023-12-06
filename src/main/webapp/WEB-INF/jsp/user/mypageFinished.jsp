<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
	<%@ include file="/WEB-INF/jsp/include/sidebar.jsp"%> 
 
 
    <input type="hidden" id="pageName" value="finish">
<!-- Page content wrapper-->
      <div class="col-md-10 col-lg-9 col-xl-10 ms-3 mt-4" id="page-content-wrapper">

            <!-- Page content-->
            <div class="container-fluid">

                <div class="row posts-entry" style="margin-bottom: 2rem;">
                
                    <div class="col-lg-10" style="text-align: right;">
						<%@ include file="/WEB-INF/jsp/include/searchformfinished.jsp"%> 
                    </div>

                    <div class="col-lg-10" style="height:620px">

					<c:forEach var="finished" items="${list}">
						<div class="blog-entry d-flex blog-entry-search-item" style="align-items: center !important;">
							<div style="flex-grow: 1;">
							<div>
								봉사기간: <span class="date" style="margin-right: 5rem !important;">${finished.volunStartDate } ~ ${finished.volunEndDate }</span>
								<p style="margin:0;">단체이름: ${finished.groupName }</p>
								<h2 style="display: inline-block;"><a href="/recruit/detail?recruitSeq=${finished.recruitSeq }">${finished.recruitTitle }</a></h2>
								<div class="btn-container" style="float: right; display: inline-block;">
									<a href="/review/writeForm?recruitSeq=${finished.recruitSeq }"><div class="btn btn-secondary me-2 my-2 my-sm-0" style="color:black; background-color:#f2f2f2; border:transparent"> 후기<br>쓰기</div></a>
								    <div class="btn btn-secondary my-2 my-sm-0" onclick="openRatingModal(${finished.recruitSeq})" style="color:black; background-color:#f2f2f2; border:transparent ">평가<br>하기</div>
								</div>
							</div>		
							
							</div>
						</div>
					</c:forEach>

                    </div>

					<!-- 권형 페이징 -->                    
 					<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>

				</div>
            </div>
      </div>
   </div>
<!-- 모달 창 -->
<div class="modal" tabindex="-1" role="dialog" id="ratingModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">평가하기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="ratingForm">
                    <input type="hidden" id="recruitSeq" name="recruitSeq">
                    <input type="hidden" id="groupMemSeq" name="groupMemSeq">
                    <input type="hidden" id="stars_value" name="stars_value">
                    
                    <!-- 별점 선택을 위한 UI 추가 -->
                    <label>별점 선택:</label>
                    <div class="rating" id="stars">
                        <i class="bi bi-star star" data-value="1"></i>
                        <i class="bi bi-star star" data-value="2"></i>
                        <i class="bi bi-star star" data-value="3"></i>
                        <i class="bi bi-star star" data-value="4"></i>
                        <i class="bi bi-star star" data-value="5"></i>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="modalClose()">취소</button>
                <button type="button" class="btn btn-primary" onclick="submitRating()">제출</button>
            </div>
        </div>
    </div>
</div>



<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>   



<style>
  /* 부트스트랩 모달 오른쪽 위에 있는 x 버튼 숨기기 */
  .modal-header .close {
    display: none;
  }
  
    /* 선택된 별을 표시할 스타일 추가 */
  .rating .bi-star-fill,
  .rating .selected {
    color: #ffc107;
  }
</style>



<script>

// 클릭한 별 버튼과 그 이전 별 버튼을 색칠하는 함수
$(document).ready(function() {
    
    // 각 별 버튼에 클릭 이벤트 추가
	$(".star").on("click", e => {
		$(".star").removeClass('bi-star-fill');
		const value = parseInt(e.target.getAttribute("data-value"));
		$("#stars_value").val(value);
		
		for (let i = 1;i<=value;i++) {
			$('.star[data-value="'+ i + '"]').addClass("bi-star-fill");
		}
		
	});
    

    // 제출 버튼 클릭 시
    $('#submitRatingBtn').click(function() {
        // 선택된 별에 대한 데이터를 사용할 수 있습니다.
        var submittedRecruitSeq = $('#recruitSeq').val();
        var submittedGroupMemSeq = $('#groupMemSeq').val();
        var submittedGrade = $('#stars_value').val();
        
        console.log('Selected Rating:', selectedRating);
        
        console.log("submittedRecruitSeq : "+submittedRecruitSeq);
        console.log("submittedGroupMemSeq : "+submittedGroupMemSeq);
        console.log("submittedGrade : "+submittedGrade);

        // 여기에 Ajax를 사용하여 서버에 평가 데이터를 전송하는 로직을 추가합니다.
        // 모달을 닫아도 좋을 경우 아래 코드를 추가합니다.
        $('#ratingModal').modal('hide');
    });
});

function openRatingModal(recruitSeq, groupMemSeq) {
    // recruitSeq와 groupMemSeq를 사용하여 해당 봉사와 단체 회원에 대한 평가를 할 수 있는 모달을 엽니다.
    // 여기에 평가하기 모달 창을 열기 위한 JavaScript 로직을 추가합니다.
    // Bootstrap Modal을 사용하면 됩니다.
    // 모달 창 내부에는 평가할 수 있는 UI 및 제출 버튼을 추가합니다.
    // Ajax를 사용하여 서버에 평가 데이터를 전송할 수 있습니다.
    // 아래는 예시 코드입니다.
    
    // Bootstrap 모달을 선택합니다.
    var modal = $('#ratingModal');

    // 평가할 봉사 및 단체 회원의 정보를 모달에 저장합니다.
    modal.find('#recruitSeq').val(recruitSeq);
    modal.find('#groupMemSeq').val(groupMemSeq);

    // 모달을 엽니다.
    modal.modal('show');
}



function submitRating() {
    // 여기에 Ajax를 사용하여 서버에 평가 데이터를 전송하는 로직을 추가합니다.
    // 모달을 닫아도 좋을 경우 아래 코드를 추가합니다.
    $('#ratingModal').modal('hide');
}

function modalClose() {
    $('.modal').modal('hide'); 
    $('.modal').hide();
    $('.jquery-modal').hide();
}
</script>







</html>
