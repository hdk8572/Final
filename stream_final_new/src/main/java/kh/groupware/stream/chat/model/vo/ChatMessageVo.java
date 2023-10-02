package kh.groupware.stream.chat.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ChatMessageVo {
	private String roomId;
	private String writer;
	private String message;
	private String cDate;
	@Override
	public String toString() {
		return "ChatMessageVo [roomId=" + roomId + ", writer=" + writer + ", message=" + message + ", cDate=" + cDate
				+ "]";
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
