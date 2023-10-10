package kh.groupware.stream.member.model.vo;

import org.springframework.stereotype.Component;

@Component
public class MyPageVo {
	private String cname;
	private String deptname;
	private String mrank;
	private String mname;
	private String mphone;
	
	private String ccode;
	private String password;
	private String deptno;
	
	@Override
	public String toString() {
		return "MyPageVo [cname=" + cname + ", deptname=" + deptname + ", mrank=" + mrank + ", mname=" + mname
				+ ", mphone=" + mphone + ", ccode=" + ccode + ", password=" + password + ", deptno=" + deptno + "]";
	}
	public MyPageVo() {
		super();
	}
	public MyPageVo(String cname, String deptname, String mrank, String mname, String mphone, String ccode,
			String password, String deptno) {
		super();
		this.cname = cname;
		this.deptname = deptname;
		this.mrank = mrank;
		this.mname = mname;
		this.mphone = mphone;
		this.ccode = ccode;
		this.password = password;
		this.deptno = deptno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getMrank() {
		return mrank;
	}
	public void setMrank(String mrank) {
		this.mrank = mrank;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	
	
}

	