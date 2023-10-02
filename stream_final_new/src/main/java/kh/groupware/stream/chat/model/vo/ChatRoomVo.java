package kh.groupware.stream.chat.model.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;

@Component
public class ChatRoomVo {
	private String roomId;
	private String roomName;
	private String writer;	//작성자
	private List<WebSocketSession> sessions = new ArrayList<>();
	
	public static ChatRoomVo create(String roomName, String writer) {
		ChatRoomVo room = new ChatRoomVo();
		room.roomId = UUID.randomUUID().toString();
		room.roomName = roomName;
		room.writer = writer;
		return room;
	}

	@Override
	public String toString() {
		return "ChatRoomVo [roomId=" + roomId + ", roomName=" + roomName + ", writer=" + writer + ", sessions="
				+ sessions + "]";
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public List<WebSocketSession> getSessions() {
		return sessions;
	}

	public void setSessions(List<WebSocketSession> sessions) {
		this.sessions = sessions;
	}

	


	
	
}
