package kh.groupware.stream.chat.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.groupware.stream.chat.model.vo.ChatMessageVo;
import kh.groupware.stream.chat.model.vo.ChatRoomVo;


@Service
public interface ChatService {
	

	List<ChatMessageVo> ViewChat(String roomId);
	int MessageInsert(ChatMessageVo vo);
	List<ChatRoomVo> findAllRooms(String userId);
	List<ChatRoomVo> findRooms(String userId);
	int AddChatRoom(String roomName,String userId);
	ChatRoomVo findRoomById(String roomId);
	List<ChatRoomVo> ViewMember();
	ChatRoomVo findWriter(String userId);
	ChatRoomVo lastMessage(String roomId);
	int memberInsert(String userId);
}