package kh.groupware.stream.chat.room;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface RoomService {
	List<RoomVo> findAllRooms();
	int AddChatRoom(String roomName,String userId);
}
