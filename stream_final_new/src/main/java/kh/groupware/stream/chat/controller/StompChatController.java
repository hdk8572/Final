package kh.groupware.stream.chat.controller;

import java.security.Principal;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import kh.groupware.stream.chat.model.dao.ChatDao;
import kh.groupware.stream.chat.model.vo.ChatMessageVo;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class StompChatController {
	
	private final ChatDao chatDao;
    private final SimpMessagingTemplate template; //특정 Broker로 메세지를 전달
    
    
    //Client가 SEND할 수 있는 경로
    //stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
    //"/pub/chat/enter"
    @MessageMapping(value = "/chat/enter")//서버에서 보내주는 컨트롤러
    public void enter(ChatMessageVo message,Principal principal) {
    	String userId = principal.getName();
    	message.setMessage(chatDao.findWriter(userId).getmName() +"님이 채팅방에 참여하였습니다.");
    	message.setmName(chatDao.findWriter(userId).getmName());
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
        System.out.println(chatDao.findWriter(userId).getmName()+"username확인");
        System.out.println(message);
    }

    @MessageMapping(value = "/chat/message")//서버에 보내는 컨트롤러
    public void message(ChatMessageVo message){
    	chatDao.MessageInsert(message);
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }
}