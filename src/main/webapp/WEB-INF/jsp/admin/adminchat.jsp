<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link href="/css/page/chat.css" rel="stylesheet">

<div class="container-chat">
    <h3 class=" text-center">채팅방</h3>
    <div class="messaging">
        <div class="inbox_msg">
            <div class="inbox_people">
                <div class="headind_srch">
                    <div class="recent_heading">
                        <h4>채팅목록</h4>
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
                                <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                            </div>
                            <div class="chat_ib">
                                ㅋㅋㅋㅋ
                                <h5>
                                    민재 <span class="chat_date">Dec 25</span>
                                </h5>
                                <p>대화방이 열렸습니다.</p>
                            </div>
                        </div>
                    </div>
                    <div class="chat_list">
                        <div class="chat_people">
                            <div class="chat_img">
                                <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                            </div>
                            <div class="chat_ib">
                                <h5>
                                    Sunil Rajput <span class="chat_date">Dec 25</span>
                                </h5>
                                <p>Test, which is a new approach to have all solutions
                                    astrology under one roof.</p>
                            </div>
                        </div>
                    </div>
                    <div class="chat_list">
                        <div class="chat_people">
                            <div class="chat_img">
                                <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                            </div>
                            <div class="chat_ib">
                                <h5>
                                    Sunil Rajput <span class="chat_date">Dec 25</span>
                                </h5>
                                <p>Test, which is a new approach to have all solutions
                                    astrology under one roof.</p>
                            </div>
                        </div>
                    </div>
                    <div class="chat_list">
                        <div class="chat_people">
                            <div class="chat_img">
                                <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                            </div>
                            <div class="chat_ib">
                                <h5>
                                    Sunil Rajput <span class="chat_date">Dec 25</span>
                                </h5>
                                <p>Test, which is a new approach to have all solutions
                                    astrology under one roof.</p>
                            </div>
                        </div>
                    </div>
                    <div class="chat_list">
                        <div class="chat_people">
                            <div class="chat_img">
                                <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                            </div>
                            <div class="chat_ib">
                                <h5>
                                    Sunil Rajput <span class="chat_date">Dec 25</span>
                                </h5>
                                <p>Test, which is a new approach to have all solutions
                                    astrology under one roof.</p>
                            </div>
                        </div>
                    </div>
                    <div class="chat_list">
                        <div class="chat_people">
                            <div class="chat_img">
                                <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                            </div>
                            <div class="chat_ib">
                                <h5>
                                    Sunil Rajput <span class="chat_date">Dec 25</span>
                                </h5>
                                <p>Test, which is a new approach to have all solutions
                                    astrology under one roof.</p>
                            </div>
                        </div>
                    </div>
                    <div class="chat_list">
                        <div class="chat_people">
                            <div class="chat_img">
                                <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                            </div>
                            <div class="chat_ib">
                                <h5>
                                    Sunil Rajput <span class="chat_date">Dec 25</span>
                                </h5>
                                <p>Test, which is a new approach to have all solutions
                                    astrology under one roof.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

				<div class="inbox_chat">
					<c:forEach var="chatRoomItem" items="${chatlist}">
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
									 <a href="#" onclick="openChatRoom('${chatRoomItem.chatRoomId}')">${chatRoomItem.roomName}</a>
									<span class="chat_date"><fmt:formatDate value="${chatRoomItem.createdRoomTime}" pattern="yyyy-MM-dd HH:mm"/></span>
									</h5>
									<p>${chatRoomItem.recruitTitle}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>


			</div>

			<div class="mesgs">
				<div class="msg_history">
					<div class="incoming_msg">
						<div class="incoming_msg_img">
							<img src="https://ptetutorials.com/images/user-profile.png"
								alt="sunil">
						</div>
						<div class="received_msg">
							<div class="received_withd_msg">
								<p>Test which is a new approach to have all solutions</p>
								<span class="time_date"> 11:01 AM | June 9</span>
							</div>
						</div>
					</div>
					<div class="outgoing_msg">
						<div class="sent_msg">
							<p>Test which is a new approach to have all solutions</p>
							<span class="time_date"> 11:01 AM | June 9</span>
						</div>
					</div>
					<div class="incoming_msg">
						<div class="incoming_msg_img">
							<img src="https://ptetutorials.com/images/user-profile.png"
								alt="sunil">
						</div>
						<div class="received_msg">
							<div class="received_withd_msg">
								<p>Test, which is a new approach to have</p>
								<span class="time_date"> 11:01 AM | Yesterday</span>
							</div>
						</div>
					</div>
					<div class="outgoing_msg">
						<div class="sent_msg">
							<p>Apollo University, Delhi, India Test</p>
							<span class="time_date"> 11:01 AM | Today</span>
						</div>
					</div>
					<div class="incoming_msg">
						<div class="incoming_msg_img">
							<img src="https://ptetutorials.com/images/user-profile.png"
								alt="sunil">
						</div>
						<div class="received_msg">
							<div class="received_withd_msg">
								<p>We work directly with our designers and suppliers, and
									sell direct to you, which means quality, exclusive products, at
									a price anyone can afford.</p>
								<span class="time_date"> 11:01 AM | Today</span>
							</div>
						</div>
					</div>
				</div>
				<div class="type_msg">
					<div class="input_msg_write" style="height: 194px;">
						<input type="text" class="write_msg" style="height: 100%;"
							placeholder="Type a message" name="message" id="message" />
						<button class="msg_send_btn" id="send_message_button" type="button">
							<i class="fa fa-paper-plane" aria-hidden="true"></i>
						</button>

					</div>
				</div>
			</div>

		</div>
		<p class="text-center top_spac">Volunteer Sunil Rajput</p>
		<!-- Back to Top -->
	</div>
</div>
<%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>
<script type="text/javascript">
	const chatRoomId = //봉사 id로 변경
	
	//MQTT 송수신 상태 설정
	const mqtt_host = "www.amond.store";
	const mqtt_port = 9001;
	const mqtt_topic = "/test/sub/" + chatRoomId;
	
    const options = {
//배포시->  	 protocol : 'wss',
  		hostname : mqtt_host,
        port: mqtt_port,
        username : 'kosa',
        password : '1004',
        clean: true,
    }
        console.log('연결중 - mqtt client');
        console.log('mqtt_topic -> ', mqtt_topic);
        
        const mqttClient = mqtt.connect(options);
        console.log('mqttClient -> ', mqttClient);
	
        const disconnect = () => {
            console.log('mqtt 연결 끊음');
            mqttClient.end();
       }  
        
        
        mqttClient.on('error', (err) => {
            console.log('연결 에러: ', err)
            mqttClient.end()
        });
          
        mqttClient.on('reconnect', () => {
            console.log('재연결중이다..')
        });
          
        mqttClient.on('connect', () => {
        	  console.log('연결됐다')
            //구독 메시지 등록 
            //메시지 수신 이벤트 핸들러 등록
            subscribe();
              
            //채팅방에 입장 메시지를 서버에 전송한다
            enterSendMessage();
        });
	
        // 구독 메시지 수신 
        mqttClient.on('message', function (topic, message) {
            // message is Buffer
            console.log("mqtt message 수신 :", message.toString())
            recvMessage(JSON.parse(message.toString()))
        })
          
        $("#message").on("keydown", e => {
        	  if (e.keyCode == 13) {
        		  sendMessage();
            }
        });
	
        $("#send_message_button").on("click", e => {
            sendMessage();
        });
            
        $("#leave_button").on("click", e => {
        	  $("#leave_button,#send_message_button").addClass("disabled");
            $("#reenter_button").removeClass("disabled");
            
            //잠시 나간다 . 메시지 수신을 하는 않는다
            unsubscribe();
                   
            //채팅방에 퇴장메시지를 서버에 전송한다
            leaveSendMessage();

<<<<<<< HEAD
        });
            
        $("#reenter_button").on("click", e => {
        	  $("#reenter_button").addClass("disabled");
            $("#leave_button,#send_message_button").removeClass("disabled");
            
            //채팅방에 입장한다
            //구독을 신청한다 
            subscribe();
                
            //채팅방에 입장 메시지를 서버에 전송한다
            enterSendMessage();
        });

            
        $(document).ready(()=>{
        	  //채팅방의 정보를 얻는다
            console.log("before getRoomInfo");            
            getRoomInfo();
                
            $(window).on("beforeunload", e => {
            	  //구독을 해제 한다
                unsubscribe();
                mqttClient.disconnect();
            })
        });

        //메시지 수신 이벤트 핸들러 등록
        //구독을 등록한다
        const subscribe = () => {
        	  mqttClient.subscribe(mqtt_topic, err => {
        		  console.log("Subscribe to a topic 생성");
        		  if (!err) {
        			  console.log("error", err);
              } else {
              }
            })
        }
            
        //메시지 수신를 해제 한다 
        //구독을 해제한다
        const unsubscribe = () => {
        	  mqttClient.unsubscribe(mqtt_topic);
        }
           
        
     // 클릭된 roomName을 통해 특정 채팅방정보를 가져옴
        function openChatRoom(chatRoomId) {
            $.ajax({ 
                type: "GET",
                url: "<c:url value='/admin/chatRoom/'/>" + chatRoomId,
                dataType: "json" // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
            }).done(resp => {
                //채팅방의 이름을 출력한다 
                console.log("getRoomInfo resp", resp);            
                $("#room-name").text(resp.name + " - " + sender);
            }).fail(err => {
                console.log("getRoomInfo error", err);            
            }); 
        }
        
        //chatRoomId를 이용하여 채팅방 정보를 출력한다 
        //현재는 이름만 출력함  
//         const getRoomInfo = () => {
//             $.ajax({ 
//                 type: "GET",
//                 url: "<c:url value='/admin/chatRoom/'/>" + chatRoomId,
//                 dataType: "json" // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
//             }).done(resp => {
//                 //채팅방의 이름을 출력한다 
//                 console.log("getRoomInfo resp", resp);            
//                 $("#room-name").text(resp.name + " - " + sender);
//             }).fail(err => {
//                 console.log("getRoomInfo error", err);            
//             }); 
//         }
            
        //입장메시지를 전송한다
        const enterSendMessage = () => {
        	  console.log("enterSendMessage ")
            
        	  //채팅방에 입장을 서버에 전송한다
        	  mqttClient.publish(mqtt_topic, JSON.stringify({type:'ENTER', chatRoomId : chatRoomId, sender : '[알림]', message : sender + "님 입장하셨습니다"}));
        }
            
        //퇴장메시지를 전송한다
        const leaveSendMessage = () => {
        	  //채팅방에 입장을 서버에 전송한다
            mqttClient.publish(mqtt_topic, JSON.stringify({type:'LEAVE', chatRoomId : chatRoomId, sender : '[알림]', message : sender + "님 퇴장하셨습니다"}));
        }
            

        //서버에 메시지를 전송한다
        const sendMessage = () => {
        	  const message = $("#message").val();
            mqttClient.publish(mqtt_topic, JSON.stringify({type:'TALK', chatRoomId : chatRoomId, sender : sender, message:message}));
            $("#message").val("");
        };
             
        const recvMessage = recv =>  {
        	  console.log(recv);
            $("#message_list").prepend('<li class="list-group-item" >[' + recv.sender + '] - ' + recv.message + '</li>'); 
        }

</script>
