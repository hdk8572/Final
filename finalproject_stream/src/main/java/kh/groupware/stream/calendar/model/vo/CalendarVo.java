package kh.groupware.stream.calendar.model.vo;

public class CalendarVo {
/*
	"USERID"	VARCHAR2(40)		NOT NULL,
	"SSTARTDATE"	VARCHAR2(20)		NOT NULL,
	"SENDDATE"	VARCHAR2(20)		NOT NULL,
	"SPLACE"	VARCHAR2(50)		NULL,
	"SMEMO"	VARCHAR2(100)		NULL,
	"STITLE"	VARCHAR2(100)		NOT NULL,
	"SNO"	VARCHAR2(10)		NOT NULL
*/
	private String userId;	//email
	private String sstartDate;	//시작일시
	private String sendDate;	//종료일시
	private String splace;	//장소	
	private String smemo;	//일정내용
	private String stitle;	//일정명
	private String sno;	//일정번호
	
	@Override
	public String toString() {
		return "CalendarVo [userId=" + userId + ", sstartDate=" + sstartDate + ", sendDate=" + sendDate + ", splace="
				+ splace + ", smemo=" + smemo + ", stitle=" + stitle + ", sno=" + sno + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSstartDate() {
		return sstartDate;
	}

	public void setSstartDate(String sstartDate) {
		this.sstartDate = sstartDate;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getSplace() {
		return splace;
	}

	public void setSplace(String splace) {
		this.splace = splace;
	}

	public String getSmemo() {
		return smemo;
	}

	public void setSmemo(String smemo) {
		this.smemo = smemo;
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}
	
	
	
	
}
