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
	private String mname;
	private String mrank;
	
	//하위 업무 추가를 위한 컬럼
	private String bref;	//bref=tno : 원본글
	private String brelevel;//0 : 원본 1 : 하위 업무
	private String brestep;	//하위 업무들간의 순서
	
	//admin 통계용
	private String tcnt;
	
	//전체보기 페이지 정렬순서 변경을 위한 컬럼
	private String ordertype;
	
	private FileVo filevo;

	@Override
	public String toString() {
		return "PtaskVo [tno=" + tno + ", pno=" + pno + ", userid=" + userid + ", tmember=" + tmember + ", ttitle="
				+ ttitle + ", tcontent=" + "CLOB" + ", tstatus=" + tstatus + ", tdate=" + tdate + ", tstartdate="
				+ tstartdate + ", tenddate=" + tenddate + ", mname=" + mname + ", mrank=" + mrank + ", bref=" + bref
				+ ", brelevel=" + brelevel + ", brestep=" + brestep + ", tcnt=" + tcnt + ", ordertype=" + ordertype
				+ ", filevo=" + filevo + "]";
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

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMrank() {
		return mrank;
	}

	public void setMrank(String mrank) {
		this.mrank = mrank;
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

	public String getTcnt() {
		return tcnt;
	}

	public void setTcnt(String tcnt) {
		this.tcnt = tcnt;
	}

	public String getOrdertype() {
		return ordertype;
	}

	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}

	public FileVo getFilevo() {
		return filevo;
	}

	public void setFilevo(FileVo filevo) {
		this.filevo = filevo;
	}
}

