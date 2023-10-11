package kh.groupware.stream.files.model.vo;

import org.springframework.stereotype.Component;

@Component
public class FileVo {

	private String fname;
	private String userid;
	private String fdate;
	private int fsize;
	private String fpath;
	private String foriginname;
	
	@Override
	public String toString() {
		return "FileVo [fname=" + fname + ", userid=" + userid + ", fdate=" + fdate + ", fsize=" + fsize + ", fpath="
				+ fpath + ", foriginname=" + foriginname + "]";
	}

	public FileVo(String fname, String userid, String fdate, int fsize, String fpath, String foriginname) {
		super();
		this.fname = fname;
		this.userid = userid;
		this.fdate = fdate;
		this.fsize = fsize;
		this.fpath = fpath;
		this.foriginname = foriginname;
	}

	public FileVo() {
		super();
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
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

	public int getFsize() {
		return fsize;
	}

	public void setFsize(int fsize) {
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
