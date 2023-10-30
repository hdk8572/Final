package kh.groupware.stream.files.model.vo;

import org.springframework.stereotype.Component;

@Component
public class FileVo {

	private String fname;
	private String tno;
	private String userid;
	private String fdate;
	private long fsize;
	private String fpath;
	private String foriginname;
	
	@Override
	public String toString() {
		return "FileVo [fname=" + fname + ", tno=" + tno + ", userid=" + userid + ", fdate=" + fdate + ", fsize="
				+ fsize + ", fpath=" + fpath + ", foriginname=" + foriginname + "]";
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
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

	public String getFdate() {
		return fdate;
	}

	public void setFdate(String fdate) {
		this.fdate = fdate;
	}

	public long getFsize() {
		return fsize;
	}

	public void setFsize(long fsize) {
		this.fsize = fsize;
	}

	public String getFpath() {
		return fpath;
	}

	public void setFpath(String fpath) {
		this.fpath = fpath;
	}

	public String getForiginname() {
		return foriginname;
	}

	public void setForiginname(String foriginname) {
		this.foriginname = foriginname;
	}
}
