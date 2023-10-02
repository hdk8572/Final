package kh.groupware.stream.chat.model.service;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.chat.model.dao.ChatDao;
import kh.groupware.stream.chat.model.vo.ChatMessageVo;
import kh.groupware.stream.chat.model.vo.ChatRoomVo;
import kh.groupware.stream.chat.model.vo.ChatVo;
@Service
public class ChatServlceImpl implements ChatService{
	
	@Autowired
	private ChatDao dao;
	
	@Override
	public List<ChatMessageVo> ViewChat(String id){
		return dao.ViewChat(id);
	}
	@Override
	public int MessageInsert(ChatMessageVo vo) {
		return dao.MessageInsert(vo);
	}
	@Override
	public List<ChatRoomVo> findAllRooms(){
		return dao.findAllRooms();
	}
	@Override
	public int AddChatRoom(String roomName,String writer) {
		return dao.AddChatRoom(roomName, writer);
	}
	@Override
	public ChatRoomVo findRoomById(String id) {
		return dao.findRoomById(id);
	}
}
