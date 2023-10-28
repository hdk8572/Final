package kh.groupware.stream.chat.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.groupware.stream.chat.model.vo.ChatMessageVo;
import kh.groupware.stream.chat.model.vo.ChatRoomVo;


@Service
public interface ChatService {
	

	List<ChatMessageVo> ViewChat(String roomId);
	int MessageInsert(ChatMessageVo vo);
	List<ChatRoomVo> FindAllRooms(String userId);
	List<ChatRoomVo> FindRooms(String userId);
	int AddChatRoom(String roomName,String userId);
	ChatRoomVo FindRoomById(String roomId);
	List<ChatRoomVo> ViewMember(String userId);
	ChatRoomVo FindWriter(String userId);
	int MemberInsert(String userId);
	 List<ChatRoomVo> FindName();
	 int ChatDelete(ChatRoomVo vo);
}