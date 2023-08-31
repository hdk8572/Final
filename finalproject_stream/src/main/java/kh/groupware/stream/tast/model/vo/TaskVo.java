package kh.groupware.stream.tast.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("tastVo")
public class TaskVo {
	
//	TNO        NOT NULL VARCHAR2(10)   
//	PNO        NOT NULL VARCHAR2(20)   
//	MNO        NOT NULL VARCHAR2(10)   
//	TMEMBER    NOT NULL VARCHAR2(10)   
//	TCONTENT   NOT NULL VARCHAR2(1200) 
//	TSTATUS    NOT NULL VARCHAR2(10)   
//	TDATE      NOT NULL DATE           
//	TSTARTDATE          DATE           
//	TENDDATE            DATE  
	
	private String tno;
	private String pno;
	private String mno;
	private String tmember;
	private String tcontent;
	private String tstatus;
	private Date tdate;
	private Date tstartdate;
	private Date tenddate;
	
	
	@Override
	public String toString() {
		return "TaskVo [tno=" + tno + ", pno=" + pno + ", mno=" + mno + ", tmember=" + tmember + ", tcontent="
				+ tcontent + ", tstatus=" + tstatus + ", tdate=" + tdate + ", tstartdate=" + tstartdate + ", tenddate="
				+ tenddate + "]";
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


	public String getMno() {
		return mno;
	}


	public void setMno(String mno) {
		this.mno = mno;
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
	
	
	
	

}
