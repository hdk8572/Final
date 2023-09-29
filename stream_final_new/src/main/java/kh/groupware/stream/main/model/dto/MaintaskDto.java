package kh.groupware.stream.main.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

//TNO        NOT NULL VARCHAR2(10)   
//PNO        NOT NULL VARCHAR2(20)   
//USERID     NOT NULL VARCHAR2(40)   
//TMEMBER    NOT NULL VARCHAR2(40)   
//TCONTENT   NOT NULL VARCHAR2(1200) 
//TSTATUS    NOT NULL VARCHAR2(10)   
//TDATE      NOT NULL DATE           
//tstartdate          DATE           
//tenddate            DATE           


@Component
public class MaintaskDto {
	private String tno;
	private String pno;
	private String userid;
	private String tmember;
	private String ttitle;
	private String tcontent;
	private String tstatus;
	private Date tdate;
	private Date tstartdate;
	private Date tenddate;
	
	//하위 업무 추가를 위한 컬럼
	private String bref;	//bref=tno : 원본글
	private String brelevel;//0 : 원본 1 : 하위 업무
	private String brestep;	//하위 업무들간의 순서
	
	@Override
	public String toString() {
		return "MaintaskDto [tno=" + tno + ", pno=" + pno + ", userid=" + userid + ", tmember=" + tmember + ", ttitle="
				+ ttitle + ", tcontent=" + tcontent + ", tstatus=" + tstatus + ", tdate=" + tdate + ", tstartdate="
				+ tstartdate + ", tenddate=" + tenddate + ", bref=" + bref + ", brelevel=" + brelevel + ", brestep="
				+ brestep + "]";
	}
	

	public MaintaskDto() {
		super();
	}


	public MaintaskDto(String tno, String pno, String userid, String tmember, String ttitle, String tcontent,
			String tstatus, Date tdate, Date tstartdate, Date tenddate, String bref, String brelevel, String brestep) {
		super();
		this.tno = tno;
		this.pno = pno;
		this.userid = userid;
		this.tmember = tmember;
		this.ttitle = ttitle;
		this.tcontent = tcontent;
		this.tstatus = tstatus;
		this.tdate = tdate;
		this.tstartdate = tstartdate;
		this.tenddate = tenddate;
		this.bref = bref;
		this.brelevel = brelevel;
		this.brestep = brestep;
	}
	
	
	
	
	
	

}
