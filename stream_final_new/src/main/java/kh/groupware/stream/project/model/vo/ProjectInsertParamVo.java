package kh.groupware.stream.project.model.vo;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import kh.groupware.stream.main.model.dto.MaintaskDto;
import kh.groupware.stream.main.model.dto.MaintaskSortVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;

@Component
public class ProjectInsertParamVo {
//	ProjectInsertParamVo
	private String pno;  // 0  sequence
	private String userid;  // 
	private String pname; // 
	private String pcontent;//
	private String paccess; //
	private String pdate;  // sysdate
	private String pstartdate;  // 
	private String penddate;  // 
	private String pstatus; //
	// addpstatus??
	// mname x
	
	private String[] memberProjectArr;//
	
	private List<String> memberProjectList;  // TODO

	@Override
	public String toString() {
		return "ProjectInsertParamVo [pno=" + pno + ", userid=" + userid + ", pname=" + pname + ", pcontent=" + "CLOB"
				+ ", paccess=" + paccess + ", pdate=" + pdate + ", pstartdate=" + pstartdate + ", penddate=" + penddate
				+ ", pstatus=" + pstatus + ", memberProjectArr=" + Arrays.toString(memberProjectArr)
				+ ", memberProjectList=" + memberProjectList + "]";
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPaccess() {
		return paccess;
	}

	public void setPaccess(String paccess) {
		this.paccess = paccess;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getPstartdate() {
		return pstartdate;
	}

	public void setPstartdate(String pstartdate) {
		this.pstartdate = pstartdate;
	}

	public String getPenddate() {
		return penddate;
	}

	public void setPenddate(String penddate) {
		this.penddate = penddate;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	public String[] getMemberProjectArr() {
		return memberProjectArr;
	}

	public void setMemberProjectArr(String[] memberProjectArr) {
		this.memberProjectArr = memberProjectArr;
	}

	public List<String> getMemberProjectList() {
		return memberProjectList;
	}

	public void setMemberProjectList(List<String> memberProjectList) {
		this.memberProjectList = memberProjectList;
	}


}