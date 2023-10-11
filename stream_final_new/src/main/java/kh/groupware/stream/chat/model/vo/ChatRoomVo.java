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
	private String userId;	//작성자
	private String mName;
	private List<WebSocketSession> sessions = new ArrayList<>();
	
	public static ChatRoomVo create(String roomName) {
		ChatRoomVo room = new ChatRoomVo();
		room.roomId = UUID.randomUUID().toString();
		room.roomName = roomName;
		return room;
	}

	@Override
	public String toString() {
		return "ChatRoomVo [roomId=" + roomId + ", roomName=" + roomName + ", userId=" + userId + ", mName=" + mName
				+ ", sessions=" + sessions + "]";
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public List<WebSocketSession> getSessions() {
		return sessions;
	}

	public void setSessions(List<WebSocketSession> sessions) {
		this.sessions = sessions;
	}

	


	


	
	
}
