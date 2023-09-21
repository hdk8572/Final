package kh.groupware.stream.project.model.vo;

import java.util.List;

import kh.groupware.stream.main.model.dto.MaintaskDto;

public class ProjectVo {
//	projectVo
	private String pno;
	private String userid;
	private String pname;
	private String pcomment;
	private String paccess;
	private String pdate;
	private String pstartDate;
	private String pendDate;
	private String prow; // 함수 Vo에 없음
	private String pstatus;
	
// deptVo + usersVo	
	private String deptno;
	private String mname;
	private String mrank;
	private String deptName;
	
//taskVo
	private List<MaintaskDto> maintaskList;

	@Override
	public String toString() {
		return "ProjectVo [pno=" + pno + ", userid=" + userid + ", pname=" + pname + ", pcomment=" + pcomment
				+ ", paccess=" + paccess + ", pdate=" + pdate + ", pstartDate=" + pstartDate + ", pendDate=" + pendDate
				+ ", prow=" + prow + ", pstatus=" + pstatus + ", deptno=" + deptno + ", mname=" + mname + ", mrank="
				+ mrank + ", deptName=" + deptName + ", maintaskList=" + maintaskList + "]";
	}

	public ProjectVo() {
		super();
	}

	
	public ProjectVo(String pno, String userid, String pname, String pcomment, String paccess, String pdate,
			String pstartDate, String pendDate, String prow, String pstatus, String deptno, String mname, String mrank,
			String deptName, List<MaintaskDto> maintaskList) {
		super();
		this.pno = pno;
		this.userid = userid;
		this.pname = pname;
		this.pcomment = pcomment;
		this.paccess = paccess;
		this.pdate = pdate;
		this.pstartDate = pstartDate;
		this.pendDate = pendDate;
		this.prow = prow;
		this.pstatus = pstatus;
		this.deptno = deptno;
		this.mname = mname;
		this.mrank = mrank;
		this.deptName = deptName;
		this.maintaskList = maintaskList;
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

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getpcomment() {
		return pcomment;
	}

	public void setpcomment(String pcomment) {
		this.pcomment = pcomment;
	}

	public String getPaccess() {
		return paccess;
	}

	public void setPaccess(String paccess) {
		this.paccess = paccess;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getPstartDate() {
		return pstartDate;
	}

	public void setPstartDate(String pstartDate) {
		this.pstartDate = pstartDate;
	}

	public String getPendDate() {
		return pendDate;
	}

	public void setPendDate(String pendDate) {
		this.pendDate = pendDate;
	}

	public String getProw() {
		return prow;
	}

	public void setProw(String prow) {
		this.prow = prow;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	public String getDeptno() {
		return deptno;
	}

	public void setDeptno(String deptno) {
		this.deptno = deptno;
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

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public List<MaintaskDto> getMaintaskList() {
		return maintaskList;
	}

	public void setMaintaskList(List<MaintaskDto> maintaskList) {
		this.maintaskList = maintaskList;
	}
	
	
}
