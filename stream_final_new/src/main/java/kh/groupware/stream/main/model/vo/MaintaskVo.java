package kh.groupware.stream.main.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class MaintaskVo {
//	task
//	TNO        NOT NULL VARCHAR2(10)   
//	PNO        NOT NULL VARCHAR2(20)   
//	USERID     NOT NULL VARCHAR2(40)   
//	TMEMBER    NOT NULL VARCHAR2(40)   
//	TCONTENT   NOT NULL VARCHAR2(1200) 
//	TSTATUS    NOT NULL VARCHAR2(10)   
//	TDATE      NOT NULL DATE           
//	TSTARTDATE          DATE           
//	TENDDATE            DATE    
//	project
//	PNAME      NOT NULL VARCHAR2(30)  
//	cnt 
	private String tno;
	private String pno;
	private String userid;
	private String tmember;
	private String tcontent;
	private String tstatus;
	private Date tdate;
	private Date tstartdate;
	private Date tenddate;
	private String pname;
	private String cnt;
	
	
	@Override
	public String toString() {
		return "MainListVo [tno=" + tno + ", pno=" + pno + ", userid=" + userid + ", tmember=" + tmember + ", tcontent="
				+ tcontent + ", tstatus=" + tstatus + ", tdate=" + tdate + ", tstartdate=" + tstartdate + ", tenddate="
				+ tenddate + ", pname=" + pname + ", cnt=" + cnt + "]";
	}
	

	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTmember() {
		return tmember;
	}
	public void setTmember(String tmember) {
		this.tmember = tmember;
	}
	public String getTcontent() {
		return tcontent;
	}
	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}
	public String getTstatus() {
		return tstatus;
	}
	public void setTstatus(String tstatus) {
		this.tstatus = tstatus;
	}
	public Date getTdate() {
		return tdate;
	}
	public void setTdate(Date tdate) {
		this.tdate = tdate;
	}
	public Date getTstartdate() {
		return tstartdate;
	}
	public void setTstartdate(Date tstartdate) {
		this.tstartdate = tstartdate;
	}
	public Date getTenddate() {
		return tenddate;
	}
	public void setTenddate(Date tenddate) {
		this.tenddate = tenddate;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	
	
	
}
