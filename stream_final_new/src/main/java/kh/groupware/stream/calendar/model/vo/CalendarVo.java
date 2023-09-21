package kh.groupware.stream.calendar.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class CalendarVo {
	/*
	"SNO"	VARCHAR2(10)		NOT NULL,
	"USERID"	VARCHAR2(40)		NOT NULL,
	"SSTARTDATE"	VARCHAR2(20)		NOT NULL,
	"SENDDATE"	VARCHAR2(20)		NOT NULL,
	"SPLACE"	VARCHAR2(50)		NULL,
	"SMEMO"	VARCHAR2(100)		NULL,
	"STITLE"	VARCHAR2(100)		NOT NULL
	
	"ATTENUSERID"	VARCHAR2(40)		NOT NULL
	*/
	private String sno;
	private String userid;
	private String splace;
	private String smemo;
//	private String sstartDate;
//	private String sendDate;
//	private String stitle;
	private String start;
	private String end;
	private String title;
	private String color;
	
	/* 끼인테이블 */
	private List<String> attenuseridList; //id 1개만 가져 올 거라 String
	
	
//	[{
//	title : '풀캘린더완성도',
//	start : '2023-09-12',
//	end : '2023-09-20',
//	color : '#'
//			+ Math.round(Math.random() * 0xffffff)
//					.toString(16)
//},]

	@Override
	public String toString() {
		return "CalendarVo [sno=" + sno + ", userid=" + userid + ", splace=" + splace + ", smemo= CLOB, start="
				+ start + ", end=" + end + ", title=" + title + ", color=" + color + ", attenuseridList=" + attenuseridList
				+ "]";
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public List<String> getAttenuseridList() {
		return attenuseridList;
	}

	public void setAttenuseridList(List<String> attenuseridList) {
		this.attenuseridList = attenuseridList;
	}

	
}
