package kh.groupware.stream.chat.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ChatMessageVo {
	private String chatname;
	private String cwriter;
	private String ccontent;
	private String cdate;
	@Override
	public String toString() {
		return "ChatMessageVo [chatname=" + chatname + ", cwriter=" + cwriter + ", ccontent=" + ccontent + ", cdate="
				+ cdate + "]";
	}
	public String getChatname() {
		return chatname;
	}
	public void setChatname(String chatname) {
		this.chatname = chatname;
	}
	public String getCwriter() {
		return cwriter;
	}
	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	
	
}
