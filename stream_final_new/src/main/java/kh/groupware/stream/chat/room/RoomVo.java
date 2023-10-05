package kh.groupware.stream.chat.room;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

import kh.groupware.stream.chat.model.vo.ChatRoomVo;

public class RoomVo {
	int roomId;
	String roomName;
	String userId;
	private List<WebSocketSession> session = new ArrayList<>();
	
	public static RoomVo create(String roomName, String userId) {
		RoomVo room = new RoomVo();
		room.roomName = roomName;
		room.userId = userId;
		return room;
	}
	
	@Override
	public String toString() {
		return "RoomVo [roomId=" + roomId + ", roomName=" + roomName + ", userId=" + userId + ", session=" + session
				+ "]";
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
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
	public List<WebSocketSession> getSession() {
		return session;
	}
	public void setSession(List<WebSocketSession> session) {
		this.session = session;
	}
	

}
