package kh.groupware.stream.member.model.vo;

//참석자의 간단한 정보를 나타내는 클래스이다.
public class MemberSimpleVo {
	private String userid;
	private String mname;
	@Override
	public String toString() {
		return "MemberSimpleVo [userid=" + userid + ", mname=" + mname + "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}

	
}
