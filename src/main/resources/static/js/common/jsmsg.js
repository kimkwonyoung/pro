/**
 * 
 * 회원 아이디 눌러서 쪽지 보내기 JS
 * 
 */

 	/* 회원 아이디 눌러서 쪽지 보내기 JS */
$(document).on("click", ".msgid", function() {
	console.log("쪽지 보내기 JS 함수 진입");
	var userInput = document.getElementById("userInput").value;
    var param = {
        userInput: userInput
    };

	fetch("<c:url value='/msg/write'/>", {
            method: "GET",
            headers: {
                "Content-Type": "application/json; charset=UTF-8",
            },
            body: JSON.stringify(param)
        })
        .then((response) => response.json())
        .then((json) => {
            if (json.status) {
                // alert("");
                // 성공적으로 삭제된 경우에 대한 처리 추가
                // commentList(boardid); // 댓글 리스트 업데이트
            } else {
                // alert("댓글 삭제에 실패했습니다.");
            }
        });
});
