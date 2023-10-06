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
	public List<ChatMessageVo> ViewChat(String userId){
		return dao.ViewChat(userId);
	}
	@Override
	public int MessageInsert(ChatMessageVo vo) {
		return dao.MessageInsert(vo);
	}
	@Override
	public List<ChatRoomVo> findAllRooms(String userId){
		return dao.findAllRooms(userId);
	}
	@Override
	public int AddChatRoom(String roomName,String userId) {
		return dao.AddChatRoom(roomName, userId);
	}
	@Override
	public ChatRoomVo findRoomById(String userId) {
		return dao.findRoomById(userId);
	}
	@Override
	public List<ChatRoomVo> ViewMember() {
		return dao.ViewMember();
	}
}
