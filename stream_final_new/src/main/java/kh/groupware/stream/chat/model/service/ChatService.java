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
	List<ChatRoomVo> findAllRooms(String userId);
	int AddChatRoom(String roomName,String userId);
	ChatRoomVo findRoomById(String roomId);
	List<ChatRoomVo> ViewMember();
	ChatRoomVo findWriter(String userId);
}