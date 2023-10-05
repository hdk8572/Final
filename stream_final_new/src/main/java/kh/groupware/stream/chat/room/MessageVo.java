package kh.groupware.stream.chat.room;

public class MessageVo {
	private int roomId;
	private String userId;
	private String message;
	private String cDate;
	@Override
	public String toString() {
		return "MessageVo [roomId=" + roomId + ", userId=" + userId + ", message=" + message + ", cDate=" + cDate + "]";
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
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

	
	
}
