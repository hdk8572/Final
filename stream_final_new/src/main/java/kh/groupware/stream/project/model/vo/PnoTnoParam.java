package kh.groupware.stream.project.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Component
public class PnoTnoParam {
	private String pno;
	private String tno;
	
	@Override
	public String toString() {
		return "PnoTnoParam [pno=" + pno + ", tno=" + tno + "]";
	}

	public PnoTnoParam(String pno, String tno) {
		super();
		this.pno = pno;
		this.tno = tno;
	}
	
	public PnoTnoParam() {
		super();
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}
	
}
