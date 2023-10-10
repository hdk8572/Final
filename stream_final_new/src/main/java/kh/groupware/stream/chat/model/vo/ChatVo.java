package kh.groupware.stream.chat.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ChatVo {
//	--COMMENT ON COLUMN "CHAT"."CCNO" IS '대화순번';
//	--COMMENT ON COLUMN "CHAT"."CHATNO" IS '채팅방번호';
//	--COMMENT ON COLUMN "CHAT"."USERID" IS 'EMAIL';
//	--COMMENT ON COLUMN "CHAT"."CCONTENT" IS '대화내용';
//	--COMMENT ON COLUMN "CHAT"."CDATE" IS '작성날짜';
//	--COMMENT ON COLUMN "CHATLIST"."CHATNAME" IS '채팅방이름'
//	--COMMENT ON COLUMN "CHAT_MEMBER"."CHATNO" IS '채팅방번호';
//	--COMMENT ON COLUMN "CHAT_MEMBER"."USERID" IS 'EMAIL';
	private String ccno;	//채팅 순서
	private String chatno;	//채팅방 번호
	private String userid;	//유저 아이디
	private String ccontent;	//대화 내용 message
	private String cdate;	//작성 날짜
	private String chatname;//채팅방 이름 roomid
	private String closed;
	private String mname;//name
	@Override
	public String toString() {
		return "ChatVo [ccno=" + ccno + ", chatno=" + chatno + ", userid=" + userid + ", ccontent=" + ccontent
				+ ", cdate=" + cdate + ", chatname=" + chatname + ", closed=" + closed + ", mname=" + mname + "]";
	}
	public String getCcno() {
		return ccno;
	}
	public void setCcno(String ccno) {
		this.ccno = ccno;
	}
	public String getChatno() {
		return chatno;
	}
	public void setChatno(String chatno) {
		this.chatno = chatno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getChatname() {
		return chatname;
	}
	public void setChatname(String chatname) {
		this.chatname = chatname;
	}
	public String getClosed() {
		return closed;
	}
	public void setClosed(String closed) {
		this.closed = closed;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	
	
	
}
