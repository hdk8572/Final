package kh.groupware.stream.calendar.model.vo;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class CalendarVo {
	/*
	"SNO"	VARCHAR2(10)		NOT NULL,
	"USERID"	VARCHAR2(40)		NOT NULL,
	"PNO"		VARCHAR2(20) 		NOT NULL,
	"SSTARTDATE"	VARCHAR2(20)		NOT NULL,
	"SENDDATE"	VARCHAR2(20)		NOT NULL,
	"SPLACE"	VARCHAR2(50)		NULL,
	"SMEMO"	VARCHAR2(100)		NULL,
	"STITLE"	VARCHAR2(100)		NOT NULL
	
	"ATTENDUSERID"	VARCHAR2(40)		NOT NULL
	*/
	private String sno;
	private String userid;  // 작성자  //insert - login, select - 다른id(참가자)
	private String pno;
	private String splace;  // 장소
	private String smemo;   // ckeditor
//	private String sstartDate;
//	private String sendDate;
//	private String stitle;
	private String start;
	private String end;
	private String title;  //제목
	private String color;
	
	private String[] attenduseridArr;  // view에서 같은 name에 여러개 값이 있을때 배열에 실림
	
	// 끼인테이블(참가자는 여기에 들어가 있음) 
	private List<String> attenduseridList; 
	
//	[{
//	title : '풀캘린더완성도',
//	start : '2023-09-12',
//	end : '2023-09-20',
//	color : '#'
//			+ Math.round(Math.random() * 0xffffff)
//					.toString(16)
//},]
	
	public CalendarVo() {
		super();
	}
	
	public CalendarVo(String sno, String userid, String pno, String splace, String smemo, String start, String end,
		String title, String color, List<String> attenduseridList) {
	super();
	this.sno = sno;
	this.userid = userid;
	this.pno = pno;
	this.splace = splace;
	this.smemo = smemo;
	this.start = start;
	this.end = end;
	this.title = title;
	this.color = color;
	this.attenduseridList = attenduseridList;
	}

	//smemo = CLOB 
	@Override
	public String toString() {
		return "CalendarVo [sno=" + sno + ", userid=" + userid + ", pno=" + pno + ", splace=" + splace + ", smemo=CLOB"
			   + ", start=" + start + ", end=" + end + ", title=" + title + ", color=" + color
				+ ", attentuseridArr=" + Arrays.toString(attenduseridArr) + ", attenduseridList=" + attenduseridList
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

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
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
	
	//AttenduseridArr 참가자
	public String[] getAttenduseridArr() {
		return attenduseridArr;
	}

	public void setAttenduseridArr(String[] attenduseridArr) {
		this.attenduseridArr = attenduseridArr;
	}

	public List<String> getAttenduseridList() {
		return attenduseridList;
	}

	public void setAttenduseridList(List<String> attenduseridList) {
		this.attenduseridList = attenduseridList;
	}
	
	
}
