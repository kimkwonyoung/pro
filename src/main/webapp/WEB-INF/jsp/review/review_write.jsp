<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/top.jsp"%>

<section class="section">
 <div class="container">
  <div class="row blog-entries element-animate">
	<div class="col-md-12 main-content">
	 <div class="post-content-body">
	  <div class="review-list">
		<h4 style="font-weight: bold;">후기 글 쓰기</h4>
	  </div>
	
	 <table class="table-review">
	 	<tr>
	 	 <th>봉사기간</th>
	 	 <td>${recruit.volunStartDate } ~ ${recruit.volunEndDate }</td>
	 	 <th>봉사분야</th>
	 	 <td>${recruit.volunCode }</td>
		</tr>
		<tr>
		 <th>봉사단체</th>
		 <td>${recruit.groupName }</td>
		 <th>봉사시간</th>
		 <td>${recruit.volunTime }</td>
		</tr>
		<tr>
		 <th>봉사지역</th>
		 <td>${recruit.volunRegion1 } ${recruit.volunRegion2 }</td>
		 <th>봉사장소</th>
		 <td>${recruit.volunAddr }</td>
		</tr>
		<tr>
		 <th>봉사대상</th>
		 	<td>${recruit.volunTarget }</td>
		 	
			 <th style="background-color: #fff;">
				<select class="form-select" id="categorySelect">
					<option value="">전체</option>
				  <c:forEach var="category" items="${categoryList }">
				  	<option value="${category.codeNumber }">${category.codeName }</option>
				  </c:forEach>
				</select>
		  	</th>
		   	<td id="categoryData"></td>
		  </tr>
		  <tr>
		   <th>제목</th>
		   	<td colspan="3"><input class="me-sm-2" type="text" id="write-title" style="width:100%"></td>
		  </tr>
	 </table>
<!-- 	 <div style="margin-top:10px; display:flex;">
		<div style="position: relative; margin: auto;">
	 		<span>제목 : </span>
	 		<input class="me-sm-2" type="text">
	 	</div>
	 </div> -->
	<div style="display: flex;">
		<div id="review-root">
		  <h2 class="review-title">썸네일 이미지</h2>
		  <hr>
		  <div class="review-contents">
		    <div class="review-upload-box">
		      <div id="drop-file" class="review-drag-file">
		        <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="review-image" >
		        <p class="review-message">Drag files to upload</p>
		        <img src="" alt="미리보기 이미지" class="review-preview">
		      </div>
		      <label class="review-file-label" for="chooseFile">이미지 파일 선택</label>
		      <input class="review-file" id="chooseFile" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif">
		    </div>
		  </div>
		</div>
		<div class="ck-form-review">
		<form id="mForm" method="post">
			<input type="hidden" id="tableName" name="tableName" value="${search.tableName }">
			<textarea id="editor" name="editor"></textarea><br/>
		</form>
		</div>
		

	</div>


	
		<input type="hidden" id="arrCategory" value="">
		<button class="btn btn-secondary my-2 my-sm-0" id="write-button" style="float:right;">등록</button>
	 </div>

	</div>
<!-- END main-content -->


    </div>
  </div>
</section>

<script>

let editor;
ClassicEditor
.create(document.querySelector('#editor'),{
	ckfinder: {
		uploadUrl : '/imageUpload?token=${token}&tableName=${search.tableName }'
	}
})
.then(editor => {
	console.log('Editor was initialized');
	window.editor = editor;
	writeeditorValue = editor;
})
.catch(error => {
	console.error(error);
});


document.querySelector('#write-button').addEventListener("click", e => {
	e.preventDefault();
	const arrCategory = document.querySelector("#arrCategory").value;
	const fileInput = document.querySelector("#chooseFile");
	const tableName = document.querySelector("#tableName").value;
	const titleValue = document.querySelector("#write-title").value;
	const recruitSeq = "${search.recruitSeq}";
	const token = "${token}";
	editorValue = writeeditorValue.getData();
	const formData = new FormData();
	
	console.log("에디터 = " + editorValue)
    // FormData에 데이터 추가
    if (fileInput.files.length > 0) {
        formData.append('file', fileInput.files[0]);
    }
	
    formData.append('arrCategory', arrCategory);
    formData.append('editor', editorValue);
    formData.append('tableName', tableName);
    formData.append('token', token);
    formData.append('title', titleValue);
    formData.append('recruitSeq', recruitSeq);

    // 서버로 데이터 전송
    fetch("/review/write/", {
        method: "POST",
        body: formData
    })
    .then(response => response.json())
    .then(result => {
        console.log(result);
        Swal.fire({
    		  title: "글 등록 완료!",
    		  icon: "success"
    		}).then(() => {
    			window.location.href = "/review/list";
    		});
    });
    
    
});

var selectedValues = [];
var realValues = [];
$("#categorySelect").on("change", function() {
    var selectedOption = $(this).find("option:selected");
    if (selectedOption) {
        const selectedValue = selectedOption.text();
        selectedValues.push(selectedValue);
        const newValue = selectedValues.join(", ");
        $("#categoryData").text(newValue);
        
        const realValue = selectedOption.val();
        realValues.push(realValue);
        $("#arrCategory").val(realValues);
        console.log(">>실제데이터 = " + realValues);
        
    }
});


let timer = setTimeout(function() {
    Swal.fire({
		  title: "시간이 만료되었습니다.",
		  icon: "error"
		}).then(() => {
			window.location.href = "/review/list"; 
		});
    
}, 10 * 60 * 1000); // 10분 

// 사용자의 상호 작용을 감지하면 타이머 재설정
document.addEventListener("mousemove", function() {
    clearTimeout(timer); // 이전 타이머 제거
    timer = setTimeout(function() {
        Swal.fire({
  		  title: "시간이 만료되었습니다.",
  		  icon: "error"
  		}).then(() => {
  			window.location.href = "/review/list"; 
  		});
    }, 10 * 60 * 1000); // 10분 
});
	


function DropFile(dropAreaId, fileListId) {
	  let dropArea = document.getElementById(dropAreaId);
	  let fileList = document.getElementById(fileListId);

	  function preventDefaults(e) {
	    e.preventDefault();
	    e.stopPropagation();
	  }

	  function highlight(e) {
	    preventDefaults(e);
	    dropArea.classList.add("highlight");
	  }

	  function unhighlight(e) {
	    preventDefaults(e);
	    dropArea.classList.remove("highlight");
	  }

	  function handleDrop(e) {
	    unhighlight(e);
	    let dt = e.dataTransfer;
	    let files = dt.files;

	    handleFiles(files);

	    const fileList = document.getElementById(fileListId);
	    if (fileList) {
	      fileList.scrollTo({ top: fileList.scrollHeight });
	    }
	  }

	  function handleFiles(files) {
	    files = [...files];
	    // files.forEach(uploadFile);
	    files.forEach(previewFile);
	  }

	  function previewFile(file) {
	    console.log(file);
	    renderFile(file);
	  }

	  function renderFile(file) {
	    let reader = new FileReader();
	    reader.readAsDataURL(file);
	    reader.onloadend = function () {
	      let img = dropArea.getElementsByClassName("review-preview")[0];
	      img.src = reader.result;
	      img.style.display = "block";
	    };
	  }

	  dropArea.addEventListener("dragenter", highlight, false);
	  dropArea.addEventListener("dragover", highlight, false);
	  dropArea.addEventListener("dragleave", unhighlight, false);
	  dropArea.addEventListener("drop", handleDrop, false);

	  return {
	    handleFiles
	  };
	}

	const dropFile = new DropFile("drop-file", "files");


</script>

<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>