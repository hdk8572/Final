package kh.groupware.stream.company.model.vo;

import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class CompanyInsertParam {

	private String ccode;
	private String cname;
	private String cphone;
	private String caddress;
	private String cpassword;

	private String defaultDeptCode; //기본 Dept 생성
	private String defaultDeptName;
	
	private String[] deptArr; //dept 값 받음
	private String[] ncemailArr; //email 값 받음
	
	private String idx;

	@Override
	public String toString() {
		return "CompanyInsertParam [ccode=" + ccode + ", cname=" + cname + ", cphone=" + cphone + ", caddress="
				+ caddress + ", cpassword=" + cpassword + ", defaultDeptCode=" + defaultDeptCode + ", defaultDeptName="
				+ defaultDeptName + ", deptArr=" + Arrays.toString(deptArr) + ", ncemailArr="
				+ Arrays.toString(ncemailArr) + ", idx=" + idx + "]";
	}

	public CompanyInsertParam() {
		super();
	}

	public CompanyInsertParam(String ccode, String cname, String cphone, String caddress, String cpassword,
			String defaultDeptCode, String defaultDeptName, String[] deptArr, String[] ncemailArr, String idx) {
		super();
		this.ccode = ccode;
		this.cname = cname;
		this.cphone = cphone;
		this.caddress = caddress;
		this.cpassword = cpassword;
		this.defaultDeptCode = defaultDeptCode;
		this.defaultDeptName = defaultDeptName;
		this.deptArr = deptArr;
		this.ncemailArr = ncemailArr;
		this.idx = idx;
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

	public String getCpassword() {
		return cpassword;
	}

	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
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

	public String[] getNcemailArr() {
		return ncemailArr;
	}

	public void setNcemailArr(String[] ncemailArr) {
		this.ncemailArr = ncemailArr;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}
	
	
}
