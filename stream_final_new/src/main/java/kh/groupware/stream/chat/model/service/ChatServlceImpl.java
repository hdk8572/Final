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
	public List<ChatMessageVo> ViewChat(String roomId){
		return dao.ViewChat(roomId);
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
	public int AddChatRoom(String roomName) {
		return dao.AddChatRoom(roomName);
	}
	@Override
	public ChatRoomVo findRoomById(String userId) {
		return dao.findRoomById(userId);
	}
	@Override
	public List<ChatRoomVo> ViewMember() {
		return dao.ViewMember();
	}
	@Override
	public int memberInsert(String userId) {
		return dao.memberInsert(userId);
	}
	@Override
	public ChatRoomVo readRoom(String roomId) {
		return dao.readRoom(roomId);
	}
}
