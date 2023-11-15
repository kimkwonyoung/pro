//package com.kosa.pro.service.test;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.ServletContext;
//
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.kosa.pro.config.test.MqttConfig;
//
//import lombok.RequiredArgsConstructor;
//
//@Service
//@RequiredArgsConstructor
//@SuppressWarnings("unchecked")
//public class MqttService {
//	@Autowired
//	MqttConfig.OutboundGateway outboundGateway;
//	@Autowired
//	ServletContext app;
//	
//	public void publishMessage(String message, String topic) throws Exception {
//		outboundGateway.sendToMqtt(message, topic);
//    }
//	
//	public void execute(String topic, String payload) throws Exception {
//    String [] cmdParams = StringUtils.split(topic, "/");
//    List<ChatDTO> chatList = (List<ChatDTO>) app.getAttribute("chatList");
//    ChatDTO chat=  new ObjectMapper().readValue(payload, ChatDTO.class);
//    if(chatList != null && chat.getType().equals("CHAT")) {
//        chatList.add(chat);
//        	app.setAttribute("chatList", chatList);
//    }else if(chatList == null && chat.getType().equals("CHAT")) {
//    	chatList = new ArrayList<>();
//    	chatList.add(chat);
//    	app.setAttribute("chatList", chatList);
//    }
//	}
//}


