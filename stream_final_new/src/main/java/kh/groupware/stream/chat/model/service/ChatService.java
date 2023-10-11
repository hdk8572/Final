package kh.groupware.stream.chat.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.groupware.stream.chat.model.vo.ChatMessageVo;
import kh.groupware.stream.chat.model.vo.ChatRoomVo;
import kh.groupware.stream.chat.model.vo.ChatVo;


@Service
public interface ChatService {
	

	List<ChatMessageVo> ViewChat(String roomId);
	int MessageInsert(ChatMessageVo vo);
	List<ChatRoomVo> findAllRooms();
	int AddChatRoom(String roomName);
	ChatRoomVo findRoomById(String id);
	List<ChatRoomVo> ViewMember();
	int memberInsert(String userId);
	ChatRoomVo readRoom(String roomId);
}