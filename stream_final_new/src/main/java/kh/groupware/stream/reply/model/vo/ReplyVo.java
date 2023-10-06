package kh.groupware.stream.reply.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ReplyVo {

	public String rno;
	public String tno;
	public String userid;
	public String rcontent;
	public String rdate;
	
	@Override
	public String toString() {
		return "ReplyVo [rno=" + rno + ", tno=" + tno + ", userid=" + userid + ", rcontent=" + rcontent + ", rdate="
				+ rdate + "]";
	}

	public ReplyVo(String rno, String tno, String userid, String rcontent, String rdate) {
		super();
		this.rno = rno;
		this.tno = tno;
		this.userid = userid;
		this.rcontent = rcontent;
		this.rdate = rdate;
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

}
