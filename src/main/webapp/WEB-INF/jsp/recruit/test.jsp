<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 목록</title>
    <link rel="stylesheet" href="/resources/css/admin/common.css">
    <link rel="stylesheet" href="/resources/css/admin/register.css">
    <link rel="stylesheet" href="/resources/css/admin/product_register.css">
    <!-- include favicon -->
	<%@include file="/WEB-INF/views/common/favicon.jsp" %>
	<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
</head>
<style>
	
	button {
	    float: right;
	    margin-left : 5px;
	    margin-bottom : 100px;
	    font-weight: 800;
	    width: 75px;
	    height: 35px;
	    background-color: rgb(175, 124, 213);
	    border: 1px solid #ceced2;
	    font-size: 16px;
	}
        
    .ck-content {
        min-height: 170px;
        padding: 0px;
    }
        
</style>

<body>

<!-- 헤더 - 로그인/로그아웃 로고, 관리자페이지 메인글씨 -->
<%@include file= "/WEB-INF/views/admin/common/header.jsp" %> 

<!-- 메인 - 보라색 가로줄(메인페이지글자), 왼쪽 메뉴 -->
<main>
    <div class="sub_content">        
<!-- 메인 - 공지사항 글 목록 테이블, 이동페이지, 수정, 삭제 -->            
                
        <div class="content">
            <h2>상품등록</h2>
            <div class="write">
                <form action="/admin/product/register" method="post" enctype="multipart/form-data">
                    <div class="product">

                       <div class="box1">
                           <div class="box2">
                               <p>대분류</p>
                           </div>
                           <div class="box3">
                               <select class="category1">
                                   <option selected value="none">선택하기</option>
                               </select>
                           </div>                      
                       </div>
                       <br>


                       <div class="box1">
                           <div class="box2">
                               <p>중분류</p>
                           </div>
                           <div class="box3">
                               <select name="category" class="category2">
                                   <option selected value="none">선택하기</option>
       
                               </select>
                           </div>                      
                       </div>
                       <br>
                       
                       
                       <div class="box1">
                           <div class="box2">
                               <p>농장 업체</p>
                           </div>
                           <div class="box3">
                               <input type="text"  name="farm_no" value="1" id="info" readonly>
                           </div>                      
                       </div>
                       <br>
   
   
                       <div class="box1">
                           <div class="box2">
                               <p>상품이름</p>
                           </div>
                           <div class="box3">
                               <input type="text"  name="name" id="info">
                           </div>                      
                       </div>
                       <br>
                       
                       <div class="box1">
                           <div class="box2">
                               <p>타이틀-레시피('사과, 오렌지' 처럼 "과일 명/채소 명"만 적기)</p>
                           </div>
                           <div class="box3">
                               <input type="text"  name="title" id="info">
                           </div>                      
                       </div>
                       <br>
   
                       <div class="box1">
                           <div class="box2">
                               <p>상품 가격</p>
                           </div>
                           <div class="box3">
                               <input type="text"  name="price"  id="price">
                           </div>         
                       </div>
                       <br>
   
                       <div class="box1">
                           <div class="box2">
                               <p>할인(%)</p>
                           </div>
                           <div class="box3">
                               <input type="text"  name="discount" maxlength="2" id="discount" value="0">
                               <input type="hidden" name="calc"  value="0">
                           </div>        
                       </div>
                       <br>
   
                       <div class="box1">
                           <div class="box2">
                               <p>할인된 가격</p>
                           </div>
                           <div class="box3">
                              <!--  <input type="text" name="discount_price"  id="discount_price" class="discount_price"> -->
                        <p name="discount_price" id="discount_price" class="discount_price"></p>
                        <input type="hidden" name="discount_price"  id="discount_price" value="" class="discount_price">
                           </div>         
                       </div>
                       <br>
   
                       <div class="box1">
                           <div class="box2">
                               <p>중량</p>
                           </div>
                           <div class="box3">
                               <input type="text"  name="weight"  id="info">
                           </div>         
                       </div>
                       <br>
   
                       <div class="box1">
                           <div class="box2">
                               <p>원산지</p>
                           </div>
                           <div class="box3">
                               <input type="text"  name="origin"  id="info">
                           </div>         
                       </div>
                       <br>
   
                       <div class="box1">
                           <div class="box2">
                               <p>재고수량</p>
                           </div>
                           <div class="box3">
                               <input type="text"  name="stock"  id="info">
                           </div>         
                       </div>
                       <br>
   
                       <!-- <p>농가업체</p> -->
                       <input type="hidden"  name="farm_no"  id="info">
                       
                       <div class="box1">
                             <div class="box2">
                               <p>메인 이미지</p>
                           </div>
                           <div class="box3">
                       <input type="file" id="main_image" name="files" />
                       <div class="select_main_image"><img src="" /></div>
                                     
                           <script>
                              $("#main_image").change(function(){
                                 if(this.files && this.files[0]) {
                                                  
                                    var reader = new FileReader;
                                                     
                                    reader.onload = function(data) {
                                       $(".select_main_image img").attr("src", data.target.result).width(200);        
                                    }
                                    reader.readAsDataURL(this.files[0]);
                                 }
                              });
                           </script>
                             </div>
		               </div>
		               <br>
                     
   
                       <div class="box1">
                           <div class="box2">
                               <p>서브 이미지1</p>
                           </div>
                           <div class="box3">
                       <input type="file" id="sub_image1" name="files" />
                        <div class="select_sub_image1"><img src="" /></div>
                                     
                           <script>
                              $("#sub_image1").change(function(){
                                 if(this.files && this.files[0]) {
                                                  
                                    var reader = new FileReader;
                                                     
                                    reader.onload = function(data) {
                                       $(".select_sub_image1 img").attr("src", data.target.result).width(200);       
                                    }
                                    reader.readAsDataURL(this.files[0]);
                                 }
                              });
                           </script>
                             </div>
                       </div>
                       <br>
                   
                   
                       <div class="box1">
                           <div class="box2">
                               <p>서브 이미지2</p>
                           </div>
                           <div class="box3">
                       <input type="file" id="sub_image2" name="files" />
                        <div class="select_sub_image2"><img src="" /></div>
                                     
                           <script>
                              $("#sub_image2").change(function(){
                                 if(this.files && this.files[0]) {
                                                  
                                    var reader = new FileReader;
                                                     
                                    reader.onload = function(data) {
                                       $(".select_sub_image2 img").attr("src", data.target.result).width(200);        
                                    }
                                    reader.readAsDataURL(this.files[0]);
                                 }
                              });
                           </script>
                             </div>             
                       </div>
                       <br>
                       
                       
                       <div class="box1">
                           <div class="box2">
                               <p>서브 이미지3</p>
                           <div class="box3">
                       <input type="file" id="sub_image3" name="files" />
                        <div class="select_sub_image3"><img src="" /></div>
                                     
                           <script>
                              $("#sub_image3").change(function(){
                                 if(this.files && this.files[0]) {
                                                  
                                    var reader = new FileReader;
                                                     
                                    reader.onload = function(data) {
                                       $(".select_sub_image3 img").attr("src", data.target.result).width(200);        
                                    }
                                    reader.readAsDataURL(this.files[0]);
                                 }
                              });
                           </script>
                             </div>           
                       </div>
                       </div>
                       <br>
   
   
                       <div class="box1">
                           <div class="box2">
                               <p>서브 이미지4</p>
                           </div>
                           <div class="box3">
                       <input type="file" id="sub_image4" name="files" />
                        <div class="select_sub_image4"><img src="" /></div>
                                     
                           <script>
                              $("#sub_image4").change(function(){
                                 if(this.files && this.files[0]) {
                                                  
                                    var reader = new FileReader;
                                                     
                                    reader.onload = function(data) {
                                       $(".select_sub_image4 img").attr("src", data.target.result).width(200);        
                                    }
                                    reader.readAsDataURL(this.files[0]);
                                 }
                              });
                           </script>
                             </div>
                       </div>
                       <br>
   
   
                       <div class="box4">
                           <div class="box2">
                               <p>상세정보내용</p>
                           </div>
                           <div class="box41">
                               <textarea name="content" id="info_textarea"></textarea>
                           </div>         
                       </div>
                       <br>
   
                       <div class="box1">
                           <div class="box2">
                               <p>상세정보내용 이미지</p>
                           </div>
                           <div class="box3">
                       <input type="file" id="content_image" name="files" />
                        <div class="select_content_image"><img src="" /></div>
                                     
                           <script>
                              $("#content_image").change(function(){
                                 if(this.files && this.files[0]) {
                                                  
                                    var reader = new FileReader;
                                                     
                                    reader.onload = function(data) {
                                       $(".select_content_image img").attr("src", data.target.result).width(200);        
                                    }
                                    reader.readAsDataURL(this.files[0]);
                                 }
                              });
                           </script>
                             </div>
                       </div>
                       <br>
                    </div>
					<div class="product_button">
						<button type="submit" id="registerBtn">등록</button>
						<button type="button" id="listBtn">목록</button>
					</div>
                       
                 </form>
            </div>
            
        </div>
        

    </div>
</main>

    
</body>




<script>   
//  ================== 1. 버튼을 클릭하면 이동함. =============================
    var listBtn = document.querySelector('#listBtn');
   
   //목록 버튼을 눌러 목록으로 돌아가기
   listBtn.addEventListener('click', function() {
      console.log('listBtn clicked');
      location.href='/admin/product/list';
   });
   

        
</script>
<script>
//================== 2. 위지윅 편집기 적용 =============================

/* 상세 정보 내용 */
    ClassicEditor
   .create(document.querySelector('#info_textarea'))
   .catch(error=>{
      console.error(error);
   });

   
</script>

<script>
//================== 3. 상품 할인율 설정 =============================

$("#discount").on("propertychange change keyup paste input", function(){

   let userInput = $("#discount"); 
   let discountInput = $("input[name='calc']"); 
   
   let discountRate = userInput.val();               // 사용자가 입력할 할인값
   let sendDiscountRate = discountRate / 100;               // 서버에 전송할 할인값
   let goodsPrice = $("input[name='price']").val();         // 원가
   let discountPrice = goodsPrice * (1 - sendDiscountRate);      // 할인가격

   // 총 할인 가격을 10원 단위까지만 표시
   discountPrice = Math.floor(discountPrice / 10) * 10; 

   $(".discount_price").html(discountPrice);
   discountInput.val(sendDiscountRate);

   $("input[name='discount_price']").attr('value',discountPrice);

});





// 입력 후 상품 가격을 수정했을 때
$("input[name='price']").on("change", function(){
   
   let userInput = $("#discount");
   let discountInput = $("input[name='calc']");
   
   let discountRate = userInput.val();                     // 사용자가 입력한 할인값
   let sendDiscountRate = discountRate / 100;               // 서버에 전송할 할인값
   let goodsPrice = $("input[name='price']").val();         // 원가
   let discountPrice = goodsPrice * (1 - sendDiscountRate);   // 할인가격
   
   // 총 할인 가격을 10원 단위까지만 표시
   discountPrice = Math.floor(discountPrice / 10) * 10; 

   $(".discount_price").html(discountPrice);
   discountInput.val(sendDiscountRate);

   $("input[name='discount_price']").attr('value',discountPrice);

});
   
</script>
<script>
   /* 카테고리 구현 */
/*    $(document).ready(function() {
      console.log('${cateList}');
      
   }); */
   
   /* 카테고리 */
   let cateList = JSON.parse('${cateList}');
   
   let cate1Array = new Array();
   let cate2Array = new Array();
   let cate1Obj = new Object();
   let cate2Obj = new Object();
   
   let cateSelect1 = $(".category1");
   let cateSelect2 = $(".category2");
   
   /* 카테고리 배열 초기화 메서드 */
   function makeCateArray(obj, array, cateList, tier) {
      
      for(let i = 0; i <cateList.length; i++) {
         if(cateList[i].tier === tier) {
            obj = new Object();
            
            obj.name = cateList[i].name;
            obj.code = cateList[i].code;
            obj.parent = cateList[i].parent;
            
            array.push(obj);
            
         } //if
         
      }// for
      
   } // end function
   
   /* 배열 초기화 */
   makeCateArray(cate1Obj, cate1Array, cateList, 1);
   makeCateArray(cate2Obj, cate2Array, cateList, 2);
   
/*    $(document).ready(function() {
      
      console.log(cate1Array);
      console.log(cate2Array);
   }); */
   
   /* 대분류 태그 */
   for(let i = 0; i < cate1Array.length; i++){
      cateSelect1.append("<option value='"+cate1Array[i].code+"'>" + cate1Array[i].name + "</option>");
   }
   
   
   /* 중분류 <option> 태그 */
   $(cateSelect1).on("change",function(){
      
      let selectVal1 = $(this).find("option:selected").val();   
      
      cateSelect2.children().remove();
      
      cateSelect2.append("<option value='none'>선택하기</option>");
      
      for(let i = 0; i < cate2Array.length; i++){
         if(selectVal1 === cate2Array[i].parent){
            cateSelect2.append("<option value='"+cate2Array[i].code+"'>" + cate2Array[i].name + "</option>");   
         }
      }// for
      
   });

</script>
</html>