package kh.groupware.stream.chat.model.service;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.chat.model.dao.ChatDao;
import kh.groupware.stream.chat.model.vo.ChatMessageVo;
import kh.groupware.stream.chat.model.vo.ChatRoomVo;
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
	public List<ChatRoomVo> findAllRooms(String userId){
		return dao.findAllRooms(userId);
	}
	@Override
	public int AddChatRoom(String roomName,String userId) {
		return dao.AddChatRoom(roomName,userId);
	}
	@Override
	public ChatRoomVo findRoomById(String roomId) {
		return dao.findRoomById(roomId);
	}
	@Override
	public List<ChatRoomVo> ViewMember() {
		return dao.ViewMember();
	}
	@Override
	public ChatRoomVo findWriter(String userId) {
		return dao.findWriter(userId);
	}
	@Override
	public List<ChatRoomVo> findRooms(String userId) {
		return dao.findRooms(userId);
	}
	@Override
	public ChatRoomVo lastMessage(String roomId) {
		return dao.lastMessage(roomId);
	}
	@Override
	public int memberInsert(String userId) {
		return dao.memberInsert(userId);
	}

}
