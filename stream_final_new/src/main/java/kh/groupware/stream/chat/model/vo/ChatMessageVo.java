package kh.groupware.stream.chat.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ChatMessageVo {
	private String roomId;
	private String userId;
	private String message;
	private String cDate;
	private String mName;
	private String roomName;
	@Override
	public String toString() {
		return "ChatMessageVo [roomId=" + roomId + ", userId=" + userId + ", message=" + message + ", cDate=" + cDate
				+ ", mName=" + mName + ", roomName=" + roomName + "]";
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
		this.cDate = cDate;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}


	
	
}
