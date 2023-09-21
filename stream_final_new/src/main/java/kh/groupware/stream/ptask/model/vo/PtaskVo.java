package kh.groupware.stream.ptask.model.vo;

public class PtaskVo {

	private String tno;
	private String pno;
	private String userid;
	private String tmember;
	private String ttitle;
	private String tcontent;
	private String tstatus;
	private String tdate;
	private String tstartDate;
	private String tendDate;
	
	//하위 업무 추가를 위한 컬럼
	private String bref;	//bref=tno : 원본글
	private String brelevel;//0 : 원본 1 : 하위 업무
	private String brestep;	//하위 업무들간의 순서
	
	
	@Override
	public String toString() {
		return "PtaskVo [tno=" + tno + ", pno=" + pno + ", userid=" + userid + ", tmember=" + tmember + ", ttitle="
				+ ttitle + ", tcontent=" + tcontent + ", tstatus=" + tstatus + ", tdate=" + tdate + ", tstartDate="
				+ tstartDate + ", tendDate=" + tendDate + ", bref=" + bref + ", brelevel=" + brelevel + ", brestep="
				+ brestep + "]";
	}

	public PtaskVo() {
		super();
	}

	public PtaskVo(String tno, String pno, String userid, String tmember, String ttitle, String tcontent,
			String tstatus, String tdate, String tstartDate, String tendDate) {
		super();
		this.tno = tno;
		this.pno = pno;
		this.userid = userid;
		this.tmember = tmember;
		this.ttitle = ttitle;
		this.tcontent = tcontent;
		this.tstatus = tstatus;
		this.tdate = tdate;
		this.tstartDate = tstartDate;
		this.tendDate = tendDate;
	}

	public PtaskVo(String tno, String pno, String userid, String tmember, String ttitle, String tstatus, String tdate,
			String tstartDate, String tendDate, String bref, String brelevel, String brestep) {
		super();
		this.tno = tno;
		this.pno = pno;
		this.userid = userid;
		this.tmember = tmember;
		this.ttitle = ttitle;
		this.tstatus = tstatus;
		this.tdate = tdate;
		this.tstartDate = tstartDate;
		this.tendDate = tendDate;
		this.bref = bref;
		this.brelevel = brelevel;
		this.brestep = brestep;
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
	public String getuserid() {
		return userid;
	}
	public void setuserid(String userid) {
		this.userid = userid;
	}
	public String getTmember() {
		return tmember;
	}
	public void setTmember(String tmember) {
		this.tmember = tmember;
	}
	public String getTtitle() {
		return ttitle;
	}
	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
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

	public String getBref() {
		return bref;
	}

	public void setBref(String bref) {
		this.bref = bref;
	}

	public String getBrelevel() {
		return brelevel;
	}

	public void setBrelevel(String brelevel) {
		this.brelevel = brelevel;
	}

	public String getBrestep() {
		return brestep;
	}

	public void setBrestep(String brestep) {
		this.brestep = brestep;
	}
	
	
	
	
}


