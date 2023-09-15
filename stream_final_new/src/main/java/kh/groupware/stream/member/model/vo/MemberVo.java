package kh.groupware.stream.member.model.vo;

import org.springframework.stereotype.Component;

@Component
public class MemberVo {
//	USERID    NOT NULL VARCHAR2(40) 
//	DEPTNO    NOT NULL VARCHAR2(10) 
//	CCODE     NOT NULL VARCHAR2(10) 
//	PASSWORD     NOT NULL VARCHAR2(20) 
//	ENABLED   NOT NULL NUMBER(1)    
//	AUTHORITY NOT NULL VARCHAR2(3)  
//	MNAME              VARCHAR2(30) 
//	MPHONE             VARCHAR2(20) 
//	MRANK              VARCHAR2(12) 
	
	private String userid; 
	private String deptno;
	private String ccode;
	private String password;
	private boolean enabled;
	private String authority;
	private String mname;
	private String mphone;
	private String mrank;
	
	@Override
	public String toString() {
		return "MemberVo [userid=" + userid + ", deptno=" + deptno + ", ccode=" + ccode + ", password=" + password
				+ ", enabled=" + enabled + ", authority=" + authority + ", mname=" + mname + ", mphone=" + mphone
				+ ", mrank=" + mrank + "]";
	}

	public MemberVo() {
		super();
	}

	public MemberVo(String userid, String deptno, String ccode, String password, boolean enabled, String authority,
			String mname, String mphone, String mrank) {
		super();
		this.userid = userid;
		this.deptno = deptno;
		this.ccode = ccode;
		this.password = password;
		this.enabled = enabled;
		this.authority = authority;
		this.mname = mname;
		this.mphone = mphone;
		this.mrank = mrank;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getDeptno() {
		return deptno;
	}

	public void setDeptno(String deptno) {
		this.deptno = deptno;
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

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
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

	public String getMrank() {
		return mrank;
	}

	public void setMrank(String mrank) {
		this.mrank = mrank;
	}
	
	
	
}