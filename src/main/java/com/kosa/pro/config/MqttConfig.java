package com.kosa.pro.config;

import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.integration.annotation.MessagingGateway;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.integration.channel.DirectChannel;
import org.springframework.integration.config.EnableIntegration;
import org.springframework.integration.core.MessageProducer;
import org.springframework.integration.mqtt.core.DefaultMqttPahoClientFactory;
import org.springframework.integration.mqtt.core.MqttPahoClientFactory;
import org.springframework.integration.mqtt.inbound.MqttPahoMessageDrivenChannelAdapter;
import org.springframework.integration.mqtt.outbound.MqttPahoMessageHandler;
import org.springframework.integration.mqtt.support.DefaultPahoMessageConverter;
import org.springframework.integration.mqtt.support.MqttHeaders;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.MessageHandler;
import org.springframework.messaging.MessageHeaders;
import org.springframework.messaging.MessagingException;
import org.springframework.messaging.handler.annotation.Header;

import com.kosa.pro.service.admin.AdminChatRoomService;



//import com.kosa.pro.service.admin.MqttService;

//MQTT 메시지를 수신하고 처리하기 위한 구성 설정
//MQTT 메시지를 발신하고 관리하기 위한 구성 설정
//MQTT 연결 옵션 및 토픽 정보를 설정하여 메시지를 주고받을 수 있게 함

@Configuration
@EnableIntegration
public class MqttConfig {
	
	/*
	 * windows 10에서 mosquitto 프로그램 설치 후 
	 * 환경설정 변수에 mosquitt 폴더 프로그램이 설치된 폴더 추가 
	 * 
	 * cmd 창에서 
	 * 메시지 구독 
	 * mosquitto_sub -h www.masungil.shop -p 51883  -t /team1/sub/# -u team1 -P 1004team1
	 * 
	 * 메시지 발행  
	 * mosquitto_pub -h www.masungil.shop -p 51883 -t /team1/sub/bbb -u team1 -P 1004team1 -m "메시지"
	 */
	
//	private final String topic = "/team1/sub/";
//  private static final String USERNAME = "team1";
//  private static final String PASSWORD = "1004team1";
	
	// MQTT 토픽 및 인증 정보 설정
  private final String topic = "/test/sub/";
  private static final String USERNAME = "kosa";
  private static final String PASSWORD = "1004";
	
  @Bean //MQTT 클라이언트가 mosquitto 브로커에 연결할 때 사용할 옵션
  public MqttConnectOptions getReceiverMqttConnectOptions() {
      MqttConnectOptions mqttConnectOptions = new MqttConnectOptions();
      mqttConnectOptions.setCleanSession(true);
      mqttConnectOptions.setConnectionTimeout(30);
      mqttConnectOptions.setKeepAliveInterval(60);
      mqttConnectOptions.setAutomaticReconnect(true);
      mqttConnectOptions.setUserName(USERNAME);
      mqttConnectOptions.setPassword(PASSWORD.toCharArray());

      String hostUrl = "tcp://www.amond.store:1883";
      mqttConnectOptions.setServerURIs(new String[] { hostUrl });
      return mqttConnectOptions;
  }

@Bean //MQTT 연결에 사용되는 클라이언트 인스턴스를 생성할 때 필요한 옵션을 설정
public MqttPahoClientFactory mqttClientFactory() {
   DefaultMqttPahoClientFactory factory = new DefaultMqttPahoClientFactory();
   
   // factory에 MQTT 연결 옵션을 설정합니다.
   // getReceiverMqttConnectOptions()는 사용자가 정의한 메서드로,
   // MQTT 연결에 필요한 옵션들을 제공합니다.
   factory.setConnectionOptions(getReceiverMqttConnectOptions());
   
   return factory;
}

  @Bean // MQTT 메시지를 수신하는 MessageProducer를 생성하는 빈 메서드
  public MessageProducer inbound() {
      String clientId2 = "uuid-" + UUID.randomUUID().toString();
      // /team1/sub : mqtt 경로
      // MQTT 경로를 설정한 MqttPahoMessageDrivenChannelAdapter를 생성
      MqttPahoMessageDrivenChannelAdapter adapter = new MqttPahoMessageDrivenChannelAdapter(clientId2,
              mqttClientFactory(), topic + "#");
      adapter.setCompletionTimeout(20000);
      adapter.setConverter(new DefaultPahoMessageConverter());
      adapter.setQos(1);
      adapter.setOutputChannel(mqttInputChannel());
      return adapter;
  }

  @Autowired // MqttService를 자동 주입
  AdminChatRoomService mqttService;

  @Bean
  public MessageChannel mqttInputChannel() {
      return new DirectChannel();
  }
//MQTT 메시지를 처리하는 MessageHandler를 생성하는 빈 메서드
  @Bean
  @ServiceActivator(inputChannel = "mqttInputChannel")
  public MessageHandler handler() {
      return new MessageHandler() {

          @Override
          public void handleMessage(Message<?> message) throws MessagingException {
        	  // 메시지의 헤더를 가져오는부분.
              MessageHeaders messageHeaders = message.getHeaders();

              // 'mqtt_receivedTopic' 키로 헤더에서 MQTT 토픽을 추출함
              String mqtt_receivedTopic = (String) messageHeaders.get("mqtt_receivedTopic");

           // MqttService가 null이 아니고, 받은 토픽이 구독 중인 토픽의 접두사로 시작하는지 체크.
              if (mqttService != null && StringUtils.startsWith(mqtt_receivedTopic, topic)) {
 
            	  // MqttService의 execute 메소드를 호출하여 MQTT 메시지를 처리합니다.
            	  // 이때, 메시지 토픽과 페이로드를 매개변수로 전달합니다.
                  mqttService.execute(mqtt_receivedTopic, (String) message.getPayload());
              }
          }
      };
  }

  @Bean // MQTT 메시지를 발신하는 MessageHandler를 생성하는 빈 메서드
  @ServiceActivator(inputChannel = "mqttOutboundChannel")
  public MessageHandler mqttOutbound() {
      MqttPahoMessageHandler messageHandler = new MqttPahoMessageHandler("testClient", mqttClientFactory());
      messageHandler.setAsync(true);
      messageHandler.setDefaultTopic("testTopic");
      return messageHandler;
  }

  @Bean // MQTT 메시지 발신 채널을 생성하는 빈 메서드
  public MessageChannel mqttOutboundChannel() {
      return new DirectChannel();
  }
  
//MQTT 메시지를 발신하기 위한 MessagingGateway 인터페이스 정의
  @MessagingGateway(defaultRequestChannel = "mqttOutboundChannel")
  public interface OutboundGateway {
      void sendToMqtt(String data, @Header(MqttHeaders.TOPIC) String topic);
  }    

}
