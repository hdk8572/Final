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
	public List<ChatRoomVo> FindAllRooms(String userId){
		return dao.FindAllRooms(userId);
	}
	@Override
	public int AddChatRoom(String roomName,String userId) {
		return dao.AddChatRoom(roomName,userId);
	}
	@Override
	public ChatRoomVo FindRoomById(String roomId) {
		return dao.FindRoomById(roomId);
	}
	@Override
	public List<ChatRoomVo> ViewMember(String userId) {
		return dao.ViewMember(userId);
	}
	@Override
	public ChatRoomVo FindWriter(String userId) {
		return dao.FindWriter(userId);
	}
	@Override
	public List<ChatRoomVo> FindRooms(String userId) {
		return dao.FindRooms(userId);
	}

	@Override
	public int MemberInsert(String userId) {
		return dao.MemberInsert(userId);
	}
	@Override
	public  List<ChatRoomVo> FindName() {
		
		return dao.FindName();
	}
	@Override
	public int ChatDelete(ChatRoomVo vo) {
		return dao.ChatDelete(vo);
	}

}
