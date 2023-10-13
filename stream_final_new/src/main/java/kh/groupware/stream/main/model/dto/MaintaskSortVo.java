package kh.groupware.stream.main.model.dto;

import org.springframework.stereotype.Component;

@Component
public class MaintaskSortVo {
	
	private String userid;
	private String ordertype;
	
	@Override
	public String toString() {
		return "MaintaskSortVo [userid=" + userid + ", ordertype=" + ordertype + "]";
	}
	
	public MaintaskSortVo() {
		super();
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getOrdertype() {
		return ordertype;
	}

	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}
	
}
