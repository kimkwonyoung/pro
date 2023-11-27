<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/admintemplate/css/adminchat.css" rel="stylesheet">

	<div class="chatcontainer">
		<h3 class=" text-center">나의 채팅방</h3>
		<div class="messaging">
			<div class="inbox_msg">
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>나의 채팅목록</h4>
						</div>
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input type="text" class="search-bar" placeholder="Search">
								<span class="input-group-addon">
									<button type="button">
										<i class="fa fa-search" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="inbox_chat">
						<div class="chat_list active_chat">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib" id="roomList">
									<h5>나의 신청게시글번호:${mychatinfo.recruitSeq}
										<span class="chat_date">Dec 25</span>
									</h5>
									<p>대화방이 열렸습니다.</p>
									<button class="enter_chat_button">채팅방 입장</button>
								</div>
							</div>
						</div>
	
					</div>
				</div>
	
			</div>
			<p class="text-center top_spac">Volunteer Sunil Rajput</p>
			<!-- Back to Top -->
		</div>
	</div>

<script type="text/javascript">


$(document).ready(() => {
    // 채팅방 입장 버튼에 대한 클릭 이벤트를 설정합니다.
    $('.enter_chat_button').on('click', function() {
        const recruitSeq = ${mychatinfo.recruitSeq};
        const sender = ${memSeq};
        enterRoom(recruitSeq, sender);
    });
});

function enterRoom(recruitSeq, sender) {

    // 사용자 식별 정보를 로컬 저장소에 저장합니다.
    localStorage.setItem('chat.recruitSeq', recruitSeq);
    localStorage.setItem('chat.sender', sender);

    // 채팅방 페이지로 이동합니다.
    location.href = '/userchat/room/enter';
}
</script>

<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>
