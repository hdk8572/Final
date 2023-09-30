package kh.groupware.stream.chat.model.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;

@Component
public class ChatRoomVo {
	private String chatname;
	private String mname;
	private String cwriter;	//작성자
	private List<WebSocketSession> sessions = new ArrayList<>();
	
	public static ChatRoomVo create(String mname, String cwriter) {
		ChatRoomVo room = new ChatRoomVo();
		room.chatname = UUID.randomUUID().toString();
		room.mname = mname;
		room.cwriter = cwriter;
		return room;
	}

	@Override
	public String toString() {
		return "ChatRoomVo [chatname=" + chatname + ", mname=" + mname + ", cwriter=" + cwriter + ", sessions="
				+ sessions + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	public String getChatname() {
		return chatname;
	}

	public void setChatname(String chatname) {
		this.chatname = chatname;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getCwriter() {
		return cwriter;
	}

	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}

	public List<WebSocketSession> getSessions() {
		return sessions;
	}

	public void setSessions(List<WebSocketSession> sessions) {
		this.sessions = sessions;
	}
	
}
