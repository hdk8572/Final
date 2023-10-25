package kh.groupware.stream.reply.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ReplyVo {

	public String rno;
	public String tno;
	public String userid;
	public String rcontent;
	public String rdate;
	public String mname;
	
	@Override
	public String toString() {
		return "ReplyVo [rno=" + rno + ", tno=" + tno + ", userid=" + userid + ", rcontent=" + rcontent + ", rdate="
				+ rdate + ", mname=" + mname + "]";
	}

	public ReplyVo() {
		super();
	}

	public String getRno() {
		return rno;
	}

	public void setRno(String rno) {
		this.rno = rno;
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}
}
