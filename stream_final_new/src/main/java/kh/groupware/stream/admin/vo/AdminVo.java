package kh.groupware.stream.admin.vo;

import org.springframework.stereotype.Component;

@Component
public class AdminVo {
	
	private String ccnt;
	private String pcnt;
	private String tcnt;
	@Override
	public String toString() {
		return "AdminVo [ccnt=" + ccnt + ", pcnt=" + pcnt + ", tcnt=" + tcnt + "]";
	}
	public AdminVo() {
		super();
	}
	public String getCcnt() {
		return ccnt;
	}
	public void setCcnt(String ccnt) {
		this.ccnt = ccnt;
	}
	public String getPcnt() {
		return pcnt;
	}
	public void setPcnt(String pcnt) {
		this.pcnt = pcnt;
	}
	public String getTcnt() {
		return tcnt;
	}
	public void setTcnt(String tcnt) {
		this.tcnt = tcnt;
	}
	
	

}
