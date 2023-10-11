package kh.groupware.stream.company.model.vo;

import org.springframework.stereotype.Component;

@Component
public class CompanyVo {
//	CCODE     NOT NULL VARCHAR2(10)  
//	CNAME     NOT NULL VARCHAR2(50)  
//	CPHONE             VARCHAR2(20)  
//	CADDRESS           VARCHAR2(200) 

	
	private String ccode;
	private String cname;
	private String cphone;
	private String caddress;
	
	//admin 통계용
	private String ccnt;

	@Override
	public String toString() {
		return "CompanyVo [ccode=" + ccode + ", cname=" + cname + ", cphone=" + cphone + ", caddress=" + caddress
				+ ", ccnt=" + ccnt + "]";
	}

	public CompanyVo() {
		super();
	}

	public CompanyVo(String ccode, String cname, String cphone, String caddress, String ccnt) {
		super();
		this.ccode = ccode;
		this.cname = cname;
		this.cphone = cphone;
		this.caddress = caddress;
		this.ccnt = ccnt;
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

	public String getCcnt() {
		return ccnt;
	}

	public void setCcnt(String ccnt) {
		this.ccnt = ccnt;
	}
	
	
}