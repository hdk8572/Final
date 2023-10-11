package kh.groupware.stream.ptask.model.vo;

import org.springframework.stereotype.Component;

import kh.groupware.stream.files.model.vo.FileVo;

@Component
public class PtaskVo {

	private String tno;
	private String pno;
	private String userid;
	private String tmember;
	private String ttitle;
	private String tcontent;
	private String tstatus;
	private String tdate;
	private String tstartdate;
	private String tenddate;
	
	//하위 업무 추가를 위한 컬럼
	private String bref;	//bref=tno : 원본글
	private String brelevel;//0 : 원본 1 : 하위 업무
	private String brestep;	//하위 업무들간의 순서
	
	private FileVo file;
	
	//admin 통계용
	private String tcnt;

	
	//전체보기 페이지 정렬순서 변경을 위한 컬럼
	private String ordertype;
	


	@Override
	public String toString() {
		return "PtaskVo [tno=" + tno + ", pno=" + pno + ", userid=" + userid + ", tmember=" + tmember + ", ttitle="
				+ ttitle + ", tcontent=" + tcontent + ", tstatus=" + tstatus + ", tdate=" + tdate + ", tstartdate="
				+ tstartdate + ", tenddate=" + tenddate + ", bref=" + bref + ", brelevel=" + brelevel + ", brestep="
				+ brestep + ", tcnt=" + tcnt + ", ordertype=" + ordertype + "]";
	}

	public PtaskVo() {
		super();


	public PtaskVo(String tno, String pno, String userid, String tmember, String ttitle, String tcontent,
			String tstatus, String tdate, String tstartdate, String tenddate, String bref, String brelevel,
			String brestep, FileVo file, String tcnt) {
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
		this.file = file;
		this.tcnt = tcnt;
	}

	public PtaskVo() {
		super();
	}
	

	

	public PtaskVo(String tno, String pno, String userid, String tmember, String ttitle, String tcontent,
			String tstatus, String tdate, String tstartdate, String tenddate, String bref, String brelevel,
			String brestep, String tcnt, String ordertype) {
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
		this.tcnt = tcnt;
		this.ordertype = ordertype;
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

	public FileVo getFile() {
		return file;
	}

	public void setFile(FileVo file) {
		this.file = file;
	}

	public String getTcnt() {
		return tcnt;
	}

	public void setTcnt(String tcnt) {
		this.tcnt = tcnt;
	}


	public String getOrderType() {
		return ordertype;
	}

	public void setOrderType(String orderType) {
		this.ordertype = orderType;
	}
}
	
	
	
	



