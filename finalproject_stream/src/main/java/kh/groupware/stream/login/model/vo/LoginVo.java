package kh.groupware.stream.login.model.vo;

import org.springframework.stereotype.Component;

@Component
public class LoginVo {
//	USERID    NOT NULL VARCHAR2(40) 
//	DEPTNO    NOT NULL VARCHAR2(10) 
//	CCODE     NOT NULL VARCHAR2(10) 
//	PASSWORD     NOT NULL VARCHAR2(20) 
//	ENABLED   NOT NULL NUMBER(1)    
//	AUTHORITY NOT NULL VARCHAR2(3)  
//	MNAME              VARCHAR2(30) 
//	MPHONE             VARCHAR2(20) 
//	MRANK              VARCHAR2(12) 
	
	private String userId;
	private String deptNo;
	private String cCode;
	private String password;
	private int enabled;
	private String authority;
	private String mName;
	private String mPhone;
	private String mRank;
	
	@Override
	public String toString() {
		return "LoginVo [userId=" + userId + ", deptNo=" + deptNo + ", cCode=" + cCode + ", password=" + password
				+ ", enabled=" + enabled + ", authority=" + authority + ", mName=" + mName + ", mPhone=" + mPhone
				+ ", mRank=" + mRank + "]";
	}

	public LoginVo() {
		super();
	}

	public LoginVo(String userId, String deptNo, String cCode, String password, int enabled, String authority,
			String mName, String mPhone, String mRank) {
		super();
		this.userId = userId;
		this.deptNo = deptNo;
		this.cCode = cCode;
		this.password = password;
		this.enabled = enabled;
		this.authority = authority;
		this.mName = mName;
		this.mPhone = mPhone;
		this.mRank = mRank;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getcCode() {
		return cCode;
	}

	public void setcCode(String cCode) {
		this.cCode = cCode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmRank() {
		return mRank;
	}

	public void setmRank(String mRank) {
		this.mRank = mRank;
	}
	
	
	
}
