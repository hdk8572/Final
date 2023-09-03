package kh.groupware.stream.ptask.model.vo;

import org.springframework.stereotype.Component;

@Component("PtaskVo")
public class PtaskVo {

	private String tno;
	private String pno;
	private String userId;
	private String tmember;
	private String tcontent;
	private String tstatus;
	private String tdate;
	private String tstartDate;
	private String tendDate;
	
	@Override
	public String toString() {
		return "PtaskVo [tno=" + tno + ", pno=" + pno + ", userId=" + userId + ", tmember=" + tmember + ", tcontent="
				+ tcontent + ", tstatus=" + tstatus + ", tdate=" + tdate + ", tstartDate=" + tstartDate + ", tendDate="
				+ tendDate + "]";
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getTdate() {
		return tdate;
	}

	public void setTdate(String tdate) {
		this.tdate = tdate;
	}

	public String getTstartDate() {
		return tstartDate;
	}

	public void setTstartDate(String tstartDate) {
		this.tstartDate = tstartDate;
	}

	public String getTendDate() {
		return tendDate;
	}

	public void setTendDate(String tendDate) {
		this.tendDate = tendDate;
	}
}


