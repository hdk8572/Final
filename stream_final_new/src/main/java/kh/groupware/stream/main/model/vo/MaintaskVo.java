package kh.groupware.stream.main.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import kh.groupware.stream.main.model.dto.MaintaskDto;

@Component
public class MaintaskVo {

	private String pno;
	private String pname;
	private String cnt;
	private List<MaintaskDto> maintaskList;
	
	
	
	@Override
	public String toString() {
		return "MaintaskVo [pno=" + pno + ", pname=" + pname + ", cnt=" + cnt + ", maintaskList=" + maintaskList
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}


	public String getPno() {
		return pno;
	}


	public void setPno(String pno) {
		this.pno = pno;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getCnt() {
		return cnt;
	}


	public void setCnt(String cnt) {
		this.cnt = cnt;
	}


	public List<MaintaskDto> getMaintaskList() {
		return maintaskList;
	}


	public void setMaintaskList(List<MaintaskDto> maintaskList) {
		this.maintaskList = maintaskList;
	}
	
	
	
	
	
	
}
