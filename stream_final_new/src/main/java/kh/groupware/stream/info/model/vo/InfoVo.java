package kh.groupware.stream.info.model.vo;

import org.springframework.stereotype.Component;

@Component
public class InfoVo {
	private String ino;
	private String itext;
	private String userId;
	private String idate;
	private String ititle;
	private String iwriter;
	private String mname;
	@Override
	public String toString() {
		return "InfoVo [ino=" + ino + ", itext=" + itext + ", userId=" + userId + ", idate=" + idate + ", ititle="
				+ ititle + ", iwriter=" + iwriter + ", mname=" + mname + "]";
	}
	public String getIno() {
		return ino;
	}
	public void setIno(String ino) {
		this.ino = ino;
	}
	public String getItext() {
		return itext;
	}
	public void setItext(String itext) {
		this.itext = itext;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getIdate() {
		return idate;
	}
	public void setIdate(String idate) {
		this.idate = idate;
	}
	public String getItitle() {
		return ititle;
	}
	public void setItitle(String ititle) {
		this.ititle = ititle;
	}
	public String getIwriter() {
		return iwriter;
	}
	public void setIwriter(String iwriter) {
		this.iwriter = iwriter;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	
	
	
}
