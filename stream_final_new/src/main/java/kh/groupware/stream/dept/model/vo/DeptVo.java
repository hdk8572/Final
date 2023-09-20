package kh.groupware.stream.dept.model.vo;

import org.springframework.stereotype.Component;

@Component
public class DeptVo {
//	DEPTNO   NOT NULL VARCHAR2(10) 
//	CCODE    NOT NULL VARCHAR2(10) 
//	DEPTNAME NOT NULL VARCHAR2(50) 
	
	private String deptno;
	private String ccode;
	private String deptname;
	
	@Override
	public String toString() {
		return "DeptVo [deptno=" + deptno + ", ccode=" + ccode + ", deptname=" + deptname + "]";
	}
	
	public DeptVo() {
		super();
	}

	public DeptVo(String ccode, String deptname) {
		super();
		this.ccode = ccode;
		this.deptname = deptname;
	}
	
	public DeptVo(String deptno, String ccode, String deptname) {
		super();
		this.deptno = deptno;
		this.ccode = ccode;
		this.deptname = deptname;
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

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
}
