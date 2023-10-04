package kh.groupware.stream.member.model.vo;

import org.springframework.stereotype.Component;

@Component
public class MyPageVo {
	private String cname;
	private String deptname;
	private String mrank;
	private String mname;
	private String mphone;
	
	public MyPageVo() {
		super();
	}

	public MyPageVo(String cname, String deptname, String mrank, String mname, String mphone) {
		super();
		this.cname = cname;
		this.deptname = deptname;
		this.mrank = mrank;
		this.mname = mname;
		this.mphone = mphone;
	}

	@Override
	public String toString() {
		return "MyPageVo [cname=" + cname + ", deptname=" + deptname + ", mrank=" + mrank + ", mname=" + mname
				+ ", mphone=" + mphone + "]";
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
	
	
}
