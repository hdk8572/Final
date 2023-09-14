package kh.groupware.stream.chat.model.vo;

public class ChatVo {
//		"CCNO"	VARCHAR2(10)		NOT NULL,
//		"CHATNO"	VARCHAR2(10)		NOT NULL,
//		"USERID"	VARCHAR2(40)		NOT NULL,
//		"CCONTENT"	VARCHAR2(300)		NOT NULL,
//		"CDATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL
	private String ccno;
	private String chatno;
	private String userId;
	private String ccontent;
	private String cdate;
	
	@Override
	public String toString() {
		return "ChatVo [ccno=" + ccno + ", chatno=" + chatno + ", userId=" + userId + ", ccontent=" + ccontent
				+ ", cdate=" + cdate + "]";
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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
