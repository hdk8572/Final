package kh.groupware.stream.project.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Component
public class PnoPrincipalParam {

	private String pno;
	private String userid;
	
	@Override
	public String toString() {
		return "PnoPrincipalParam [pno=" + pno + ", userid=" + userid + "]";
	}
	
	public PnoPrincipalParam(String pno, String userid) {
		super();
		this.pno = pno;
		this.userid = userid;
	}

	public PnoPrincipalParam() {
		super();
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
}
