package kh.groupware.stream.chat.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.chat.model.vo.ChatMessageVo;
import kh.groupware.stream.chat.model.vo.ChatRoomVo;


@Service
public class RoomServiceImpl implements RoomService{
	@Autowired
	private RoomDao dao;

	@Override
	public int AddChatRoom(String roomName, String userId) {
		return dao.AddChatRoom(roomName, userId);
	}

	@Override
	public List<RoomVo> findAllRooms() {
		return dao.findAllRooms();
	}

	
	
}
