package kh.groupware.stream.company.model.vo;

import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class CompanyInsertParam {

	private String ccode;
	private String cname;
	private String cphone;
	private String caddress;

	private String defaultDeptCode; //기본 Dept 생성
	private String defaultDeptName;
	
	private String[] deptArr; //dept 값 받음
	private String[] emailArr; //email 값 받음
	
	private String idx;
	
	private String password;

	@Override
	public String toString() {
		return "CompanyInsertParam [ccode=" + ccode + ", cname=" + cname + ", cphone=" + cphone + ", caddress="
				+ caddress + ", defaultDeptCode=" + defaultDeptCode + ", defaultDeptName=" + defaultDeptName
				+ ", deptArr=" + Arrays.toString(deptArr) + ", emailArr=" + Arrays.toString(emailArr) + ", idx=" + idx
				+ ", password=" + password + "]";
	}

	public CompanyInsertParam() {
		super();
	}

	public CompanyInsertParam(String ccode, String cname, String cphone, String caddress, String defaultDeptCode,
			String defaultDeptName, String[] deptArr, String[] emailArr, String idx, String password) {
		super();
		this.ccode = ccode;
		this.cname = cname;
		this.cphone = cphone;
		this.caddress = caddress;
		this.defaultDeptCode = defaultDeptCode;
		this.defaultDeptName = defaultDeptName;
		this.deptArr = deptArr;
		this.emailArr = emailArr;
		this.idx = idx;
		this.password = password;
	}

	public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		this.ccode = ccode;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCphone() {
		return cphone;
	}

	public void setCphone(String cphone) {
		this.cphone = cphone;
	}

	public String getCaddress() {
		return caddress;
	}

	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}

	public String getDefaultDeptCode() {
		return defaultDeptCode;
	}

	public void setDefaultDeptCode(String defaultDeptCode) {
		this.defaultDeptCode = defaultDeptCode;
	}

	public String getDefaultDeptName() {
		return defaultDeptName;
	}

	public void setDefaultDeptName(String defaultDeptName) {
		this.defaultDeptName = defaultDeptName;
	}

	public String[] getDeptArr() {
		return deptArr;
	}

	public void setDeptArr(String[] deptArr) {
		this.deptArr = deptArr;
	}

	public String[] getEmailArr() {
		return emailArr;
	}

	public void setEmailArr(String[] emailArr) {
		this.emailArr = emailArr;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	
}