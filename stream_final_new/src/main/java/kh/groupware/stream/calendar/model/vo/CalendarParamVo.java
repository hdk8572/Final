package kh.groupware.stream.calendar.model.vo;

import org.springframework.stereotype.Component;

@Component
public class CalendarParamVo {
	
	private String userid;
	private String pno;
	@Override
	public String toString() {
		return "CalendarParamVo [userid=" + userid + ", pno=" + pno + "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	
	
}
