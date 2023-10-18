package kh.groupware.stream.member.model.vo;

//참석자의 간단한 정보를 나타내는 클래스이다.
public class MemberSimpleVo {

	private String userid;
	private String mname;
	private String mrank;

	@Override
	public String toString() {
		return "MemberSimpleVo [userid=" + userid + ", mname=" + mname + ", mrank=" + mrank + "]";
	}

	public MemberSimpleVo(String userid, String mname) {
		super();
		this.userid = userid;
		this.mname = mname;
	}
	
	public MemberSimpleVo() {
		super();
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

	public String getMrank() {
		return mrank;
	}

	public void setMrank(String mrank) {
		this.mrank = mrank;
	}
	
}
