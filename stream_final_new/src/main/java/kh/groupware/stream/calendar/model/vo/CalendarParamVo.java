package kh.groupware.stream.calendar.model.vo;

import org.springframework.stereotype.Component;

@Component
public class CalendarParamVo {
	
	private String userid;
	private String pno;
	
	// TODO
	private String startdate;
	private String enddate;
	
	@Override
	public String toString() {
		return "CalendarParamVo [userid=" + userid + ", pno=" + pno + ", startdate=" + startdate + ", enddate="
				+ enddate + "]";
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

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	
}
