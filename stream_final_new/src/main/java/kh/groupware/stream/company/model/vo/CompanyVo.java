package kh.groupware.stream.company.model.vo;

import org.springframework.stereotype.Component;

@Component
public class CompanyVo {
//	CCODE     NOT NULL VARCHAR2(10)  
//	CNAME     NOT NULL VARCHAR2(50)  
//	CPHONE             VARCHAR2(20)  
//	CADDRESS           VARCHAR2(200) 
//	CPASSWORD NOT NULL VARCHAR2(20)  
	
	private String ccode;
	private String cname;
	private String cphone;
	private String caddress;
	private String cpassword;
	
	@Override
	public String toString() {
		return "CompanyVo [ccode=" + ccode + ", cname=" + cname + ", cphone=" + cphone + ", caddress=" + caddress
				+ ", cpassword=" + cpassword + "]";
	}

	public CompanyVo() {
		super();
	}

	public CompanyVo(String ccode, String cname, String cphone, String caddress, String cpassword) {
		super();
		this.ccode = ccode;
		this.cname = cname;
		this.cphone = cphone;
		this.caddress = caddress;
		this.cpassword = cpassword;
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
	
}
