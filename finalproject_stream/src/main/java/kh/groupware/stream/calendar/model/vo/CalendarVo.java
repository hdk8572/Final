package kh.groupware.stream.calendar.model.vo;

public class CalendarVo {
/*
	"SNO"	VARCHAR2(10)		NOT NULL,
	"MNO"	VARCHAR2(10)		NULL,
	"SSTARTDATE"	VARCHAR2(20)		NOT NULL,
	"SENDDATE"	VARCHAR2(20)		NOT NULL,
	"SPLACE"	VARCHAR2(50)		NULL,
	"SMEMO"	VARCHAR2(100)		NULL,
    "STITLE" VARCHAR2(100)     NOT NULL
*/
	private String sno;
	private String mno;
	private String sstartdate;
	private String senddate;
	private String smemo;
	private String stitle;
	
	@Override
	public String toString() {
		return "CalendarVo [sno=" + sno + ", mno=" + mno + ", sstartdate=" + sstartdate + ", senddate=" + senddate
				+ ", smemo=" + smemo + ", stitle=" + stitle + "]";
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getSstartdate() {
		return sstartdate;
	}

	public void setSstartdate(String sstartdate) {
		this.sstartdate = sstartdate;
	}

	public String getSenddate() {
		return senddate;
	}

	public void setSenddate(String senddate) {
		this.senddate = senddate;
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
	
	
	
}
