<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/top.jsp"%>

<section class="section">
 <div class="container">
  <div class="row blog-entries element-animate">
	<div class="col-md-12 col-lg-8 main-content">
	 <div class="post-content-body">
	  <div class="review-list">
		<h4 style="font-weight: bold;">후기 글 쓰기</h4>
	  </div>
	 <table class="table-review">
	 	<tr>
	 	 <th>봉사기간</th>
	 	 <td>2023-10-21 ~ 2023-10-29</td>
	 	 <th>봉사분야</th>
	 	 <td>시설봉사</td>
		</tr>
		<tr>
		 <th>봉사단체</th>
		 <td>혜화불주먹해적단</td>
		 <th>봉사시간</th>
		 <td>8시간</td>
		</tr>
		<tr>
		 <th>봉사지역</th>
		 <td>서울시 종로구</td>
		 <th>봉사장소</th>
		 <td>혜화역</td>
		</tr>
		<tr>
		 <th>봉사대상</th>
		 <td>부족한친구들</td>
		 <th style="background-color: #fff;">
		  <select class="form-select">
		  	<option>시설봉사</option>
		  	<option>전문봉사</option>
		  	<option>지역사회봉사</option>
		  	<option>금,물품봉사</option>
		  	<option>해외봉사</option>
		  	<option>기타봉사</option>
		  	<option>재가봉사</option>
		  	<option>헌혈</option>
		   </select>
		  </th>
		   <td>카테고리선택한데이터</td>
		  </tr>
	 </table>
	<div>
		<form id="mForm" method="post">			
			<input type="hidden" id="tableName" name="tableName" value="${tableName }">
			<textarea id="editor" name="editor"></textarea><br/>
			<input type="submit" value="Upload" />
		</form>
	</div>
		<button class="btn btn-secondary my-2 my-sm-0" >등록</button>
	 </div>

	</div>
<!-- END main-content -->

<div class="col-md-12 col-lg-4 sidebar">
  <!-- END sidebar-box -->  
  <div class="sidebar-box">
    <h3 class="heading">인기 후기글</h3>
    <div class="post-entry-sidebar">
      <ul>
		<li>
		<a href="">
			<img src="images/img_1_sq.jpg" alt="Image placeholder" class="me-4 rounded">
			<div class="text">
				<h4>[제주] 저는 자랑스러운 JDC 드림나눔 봉사단 담당자입니다</h4>
				<div class="post-meta">
					<span class="mr-2">2023-10-12 </span>
				</div>
			</div>
		</a>
		</li>
		<li>
		<a href="">
			<img src="images/img_2_sq.jpg" alt="Image placeholder" class="me-4 rounded">
			<div class="text">
				<h4>[경북] 소소한 일상으로부터의 변화, 아무튼 봉사</h4>
				<div class="post-meta">
					<span class="mr-2">2023-10-23 </span>
				</div>
			</div>
		</a>
		</li>
		<li>
		<a href="">
			<img src="images/img_3_sq.jpg" alt="Image placeholder" class="me-4 rounded">
			<div class="text">
				<h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>
				<div class="post-meta">
					<span class="mr-2">2023-10-30 </span>
				</div>
			</div>
		</a>
		</li>
      </ul>
    </div>
  </div>
  <!-- END sidebar-box -->

    <div class="sidebar-box">
      <h3 class="heading">Categories</h3>
		<ul class="categories">
			<li><a href="#">시설봉사 <span>(12)</span></a></li>
			<li><a href="#">전문봉사 <span>(22)</span></a></li>
			<li><a href="#">지역사회봉사 <span>(37)</span></a></li>
			<li><a href="#">금,물품봉사 <span>(37)</span></a></li>
			<li><a href="#">해외봉사 <span>(42)</span></a></li>
			<li><a href="#">기타봉사 <span>(5)</span></a></li>
			<li><a href="#">재가봉사 <span>(14)</span></a></li>
			<li><a href="#">헌혈 <span>(124)</span></a></li>
		</ul>
    </div>
    <!-- END sidebar-box -->
</div>
<!-- END sidebar -->

    </div>
  </div>
</section>

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

<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>