package kh.groupware.stream.chat.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.groupware.stream.chat.model.vo.ChatVo;


@Service
public interface ChatService {
	
	List<ChatVo> selectuserList();
	
}