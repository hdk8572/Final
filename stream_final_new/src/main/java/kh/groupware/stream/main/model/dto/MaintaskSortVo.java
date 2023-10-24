package kh.groupware.stream.main.model.dto;

import org.springframework.stereotype.Component;

@Component
public class MaintaskSortVo {	//업무 정렬을 위한 Vo
	
	private String userid;	//로그인한 사람 id
	private String ordertype;	// 정렬 순서
	
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
