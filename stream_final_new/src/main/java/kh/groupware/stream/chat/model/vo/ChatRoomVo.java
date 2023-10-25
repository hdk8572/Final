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
	private String userId;	
	private String mname;
	private Integer sessions;
	
	public static ChatRoomVo create(String roomName,String userId) {
		ChatRoomVo room = new ChatRoomVo();
		room.roomId = UUID.randomUUID().toString();
		room.roomName = roomName;
		room.userId = userId;
		return room;
	}
	public static ChatRoomVo member(String roomId,String userId) {
		ChatRoomVo room = new ChatRoomVo();
		room.roomId = roomId;
		room.userId = userId;
		return room;
	}

	@Override
	public String toString() {
		return "ChatRoomVo [roomId=" + roomId + ", roomName=" + roomName + ", userId=" + userId + ", mname=" + mname
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
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public Integer getSessions() {
		return sessions;
	}
	public void setSessions(Integer sessions) {
		this.sessions = sessions;
	}
	
	

	


	


	
	
}
