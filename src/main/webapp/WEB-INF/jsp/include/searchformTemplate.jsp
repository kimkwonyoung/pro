<!-- 보니까 이거 페이지마다 폼이 다를 수 있음, 따라서 수정해야 하면 여기서 긁어서 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <style>

    /* select 부분 ex) - 선택 - , 모집중 */
    select{
        height:35px;
        border:1px solid #b6c2cb;
        vertical-align:middle;
        border-radius:4px;
        -webkit-border-radius:4px;
        -moz-border-radius:4px;
        -o-border-radius:4px
    }


    /* 검색 버튼 */
    .blue{
    background-color:#285ed8
    }

    /* 검색 버튼 */
    .btnBasic{
    display:inline-block;
    min-height:35px;
    text-align:center;
    padding:5px 20px;
    color:#fff;
    background-color:#7a7a7a;x
    border-radius:4px;
    box-sizing:border-box;
    vertical-align:middle;
    border:none
    }

    #rightArea .con {
    position: relative;
    padding: 36px 30px 50px 70px;
    box-sizing: border-box;
    line-height: 140%
}

    .volunteerSearch dl {
    float: left;
    position: relative;
    width: 60%;
    min-height: 35px;
    margin: 0 0 5px 0;
    padding: 0 0 0 70px;
    box-sizing: border-box
    }
    .volunteerSearch dl.dl02{
        float:none;
        width:100%
    }
    .volunteerSearch dl.dl01 .part{
        width:100%
    }
    .volunteerSearch dl.dl04{
        width:100%
    }

    .volunteerSearch dl{
        padding:0
    }
    .volunteerSearch dl dt{
        position:relative
    }
    .volunteerSearch dl dt.dt2{
        line-height:34px
    }
    .volunteerSearch dl dt.dt2 br{
        display:none
    }

    .volunteerSearch{
    position:relative;
    padding:0 0 37px 0
  }
  rch .group.group_search select{
      position:absolute;
      left:0;
      width:160px
  }
  .volunteerSearch .searchBases{
      position:relative;
      padding:20px 20px 5px 20px;
      box-sizing:border-box;
      background:#edf7fb
  }
  .volunteerSearch .searchBases:after,.volunteerSearch .searchDetail:after{
      content:"";
      display:block;
      clear:both
  }
  .volunteerSearch .searchDetail{
      display:none;
      position:relative;
      padding:15px 20px;
      box-sizing:border-box;
      background:#ededed
  }
  .volunteerSearch dl{
      float:left;
      position:relative;
      width:60%;
      min-height:35px;
      margin:0 0 5px 0;
      padding:0 0 0 70px;
      box-sizing:border-box
  }
  .volunteerSearch dl dt{
      position:absolute;
      left:0;
      top:0;
      min-width:55px;
      font-size:13px;
      color:#0172c0;
      line-height:35px;
      font-weight:700
  }
  .volunteerSearch dl dt.dt2{
      line-height:120%
  }
  .volunteerSearch dl dd{
      position:relative
  }
  .volunteerSearch dl dd:after{
      content:"";
      display:block;
      clear:both
  }
  .volunteerSearch dl dd input[type="text"],.volunteerSearch dl dd select{
      width:100%
  }
  .volunteerSearch dl dd .part{
      float:left;
      position:relative;
      width:48.5%;
      box-sizing:border-box
  }
  .volunteerSearch dl dd .part_r{
      float:right
  }
  .volunteerSearch dl.dl02{
      float:right;
      width:35%
  }
  .volunteerSearch dl.dl03{
      width:100%
  }
  .volunteerSearch dl.dl03 dd select{
      width:27.2%
  }
  .volunteerSearch dl.dl03 dd input[type="text"]{
      float:right;
      width:71%
  }
  .volunteerSearch dl.dl04{
      clear:both;
      float:none;
      width:44%
  }
  .volunteerSearch dl.dl04 dd{
      position:relative;
      padding:0 85px 0 0;
      box-sizing:border-box
  }
  .volunteerSearch dl.dl04 dd .ex_f{
      position:absolute;
      right:0;
      top:8px;
      display:inline-block;
      width:65px;
      text-align:left
  }
  .volunteerSearch .btn{
      position:absolute;
      right:0;
      bottom:0;
      padding:12px;
      color:#424242;
      background:#ededed;
      border-radius:0 0 8px 8px
  }
  .volunteerSearch .btn .ico{
      display:inline-block;
      width:9px;
      height:9px;
      margin:0 3px 0 0;
      background:url(../img/ico.png) -24px -181px
  }
  .volunteerSearch .btn.opened .ico{
      background:url(../img/ico.png) -36px -181px
  }
  .tc{
      text-align:center!important
  }
  
  .position_right{
      text-align:right !important
  }

  </style>
  

  <form id="searchFm" method="GET">
    <div class="volunteerSearch">
      <div class="searchBases">
        <dl>
          <dt>활동지역</dt>
          <dd>
            <div class="part">
              <select id="area" name="area" title="활동지역 선택" onchange="drawAreaList(this);">
                <option value=""> - 선택 - </option>
                
                  
                  <option value="0100">중앙</option>
                  
                  
                
                  
                  <option value="0101">서울</option>
                  
                  
                
                  
                  <option value="0102">부산</option>
                  
                  
                
                  
                  <option value="0103">대구</option>
                  
                  
                
                  
                  <option value="0104">인천</option>
                  
                  
                
                  
                  <option value="0105">광주</option>
      
                  
                
              </select>
            </div>
            <div class="part part_r">
              <select id="areagugun" name="areagugun" title="시/군/구 선택을 선택">
                <option value="" selected="selected"> - 선택 - </option>
                
                  
                    <option value="0000000000" >중앙</option>
                  
                  
                
                  
                    <option value="1100000000" >서울특별시</option>
                  
                  
                
                  
                    <option value="1111000000" >서울특별시 종로구</option>
                  
                
                  
                    <option value="5013000000" >제주특별자치도 서귀포시</option>
                  
                  
                
              </select>
            </div>
          </dd>
        </dl>
        <dl class="dl02">
          <dt>활동분야</dt>
          <dd>
            <select id="acttype" name="acttype" title="활동분야 선택">
              <option value=""> - 선택 - </option>
              
                <option value="01"
                  >시설봉사</option>
              
                <option value="02"
                  >재가봉사</option>
              
                <option value="03"
                  >전문봉사</option>
              
                <option value="04"
                  >지역사회봉사</option>
              
                <option value="05"
                  >금,물품봉사</option>
              
              
            </select>
          </dd>
        </dl>
        <dl class="dl01">
          <dt>모집현황</dt>
          <dd>
            <div class="part">
              <select name="status" id="status" title="모집현황 선택"
                class="year">
                <option value="">- 선택 -</option>
                
                  <option value="1" selected="selected">모집중</option>
                
                
                <option value="2" >모집완료</option>
              </select>
            </div>
          </dd>
        </dl>
        <dl class="dl02">
          <dt class="dt2">
            청소년 여부
          </dt>
          <dd>
            <label><input type="checkbox" name="teenager_yn" value="Y"  title="청소년봉사일감 선택"> 청소년도 참여 가능해요.</label>
          </dd>
        </dl>
        <dl class="dl01">
          <dt>활동유형</dt>
          <dd>
            <div class="part">
              <select name="volacttype" id="volacttype" chk="null" class="null" if="null" title="활동유형" style="width:100px;"><option value="">- 선택 -</option><option value="01" >대면</option><option value="02" >비대면</option><option value="03" >대면+비대면</option></select>
            </div>
          </dd>		
        </dl>
        <div class="dl02 position_right">
            <button type="button" class="btn btn-secondary my-2 my-sm-0 text-white" onclick="goPage(1);" style="background-color:#285ed8;">검색</button>
        </div>
      </div>
      
      
    </div>
  </form>
