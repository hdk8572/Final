package kh.groupware.stream.main.model.dto;

import org.springframework.stereotype.Component;

@Component
public class MaintaskSortVo {
//	ttitle, tstatus, tmember, tstartdate, tenddate, tdate, tno, pno, pname, userid, bref, brestep, brelevel
	private String pno;
	private String userid;
	
	private String ttitle;
	private String tstatus;
	private String tmember;
	private String tstartdate;
	private String tenddate;
	private String tdate;
	private String tno;
	private String pname;
	
	private String bref;
	private String brestep;
	private String brelevel;
	
	private String orderType;

	@Override
	public String toString() {
		return "MaintastSortVo [userid=" + userid + ", ttitle=" + ttitle + ", tstatus=" + tstatus + ", tmember="
				+ tmember + ", tstartdate=" + tstartdate + ", tenddate=" + tenddate + ", tdate=" + tdate + ", tno="
				+ tno + ", pno=" + pno + ", pname=" + pname + ", bref=" + bref + ", brestep=" + brestep + ", brelevel="
				+ brelevel + ", orderType=" + orderType + "]";
	}

	public MaintaskSortVo() {
		super();
	}

	public MaintaskSortVo(String userid, String ttitle, String tstatus, String tmember, String tstartdate,
			String tenddate, String tdate, String tno, String pno, String pname, String bref, String brestep,
			String brelevel, String orderType) {
		super();
		this.userid = userid;
		this.ttitle = ttitle;
		this.tstatus = tstatus;
		this.tmember = tmember;
		this.tstartdate = tstartdate;
		this.tenddate = tenddate;
		this.tdate = tdate;
		this.tno = tno;
		this.pno = pno;
		this.pname = pname;
		this.bref = bref;
		this.brestep = brestep;
		this.brelevel = brelevel;
		this.orderType = orderType;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTtitle() {
		return ttitle;
	}

	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}

	public String getTstatus() {
		return tstatus;
	}

	public void setTstatus(String tstatus) {
		this.tstatus = tstatus;
	}

	public String getTmember() {
		return tmember;
	}

	public void setTmember(String tmember) {
		this.tmember = tmember;
	}

	public String getTstartdate() {
		return tstartdate;
	}

	public void setTstartdate(String tstartdate) {
		this.tstartdate = tstartdate;
	}

	public String getTenddate() {
		return tenddate;
	}

	public void setTenddate(String tenddate) {
		this.tenddate = tenddate;
	}

	public String getTdate() {
		return tdate;
	}

	public void setTdate(String tdate) {
		this.tdate = tdate;
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

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getBref() {
		return bref;
	}

	public void setBref(String bref) {
		this.bref = bref;
	}

	public String getBrestep() {
		return brestep;
	}

	public void setBrestep(String brestep) {
		this.brestep = brestep;
	}

	public String getBrelevel() {
		return brelevel;
	}

	public void setBrelevel(String brelevel) {
		this.brelevel = brelevel;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	
	
	

	
}
