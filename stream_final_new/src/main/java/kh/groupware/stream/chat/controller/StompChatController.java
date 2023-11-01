package kh.groupware.stream.chat.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
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
    private final SimpMessagingTemplate template; 
    
    @Autowired
    public StompChatController(ChatDao chatDao, SimpMessagingTemplate template) {
        this.chatDao = chatDao;
        this.template = template;
    }
    
    @MessageMapping(value = "/chat/enter")
    public void enterStomp(ChatMessageVo message,Principal principal) {
    	String userId = principal.getName();
    	message.setMessage(chatDao.FindWriter(userId).getMname() +"님이 채팅방에 참여하였습니다.");
    	message.setMname(chatDao.FindWriter(userId).getMname());
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }
    @MessageMapping(value = "/chat/message")
    public void messageStomp(ChatMessageVo message,Principal principal){
    	String userId = principal.getName(); 
    	chatDao.MessageInsert(message);
    	message.setMname(chatDao.FindWriter(userId).getMname());
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);      
    }


}
