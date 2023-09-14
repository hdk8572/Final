package kh.groupware.stream.chat.model.dao;

import java.util.List;

import kh.groupware.stream.chat.model.vo.ChatVo;

public interface ChatService {
	
	public List<ChatVo> selectList();

}