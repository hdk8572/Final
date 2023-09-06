package kh.groupware.stream.project.model.vo;


public class ProjectVo {
	
	private String pno;
	private String userId;
	private String pname;
	private String pcoment;
	private String paccess;
	private String pdate;
	private String pstartDate;
	private String pendDate;
	
	@Override
	public String toString() {
		return "ProjectVo [pno=" + pno + ", userId=" + userId + ", pname=" + pname + ", pcoment=" + pcoment
				+ ", paccess=" + paccess + ", pdate=" + pdate + ", pstartDate=" + pstartDate + ", pendDate=" + pendDate
				+ "]";
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

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcoment() {
		return pcoment;
	}

	public void setPcoment(String pcoment) {
		this.pcoment = pcoment;
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

	
}
