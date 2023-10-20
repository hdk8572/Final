package kh.groupware.stream.project.model.vo;
import java.util.List;

import org.springframework.stereotype.Component;

import kh.groupware.stream.main.model.dto.MaintaskDto;
import kh.groupware.stream.main.model.dto.MaintaskSortVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;

@Component
public class ProjectVo {
//	projectVo
	private String pno;
	private String userid;
	private String pname;
	private String paccess;
	private String prow;
	private String countmember;
	private String pstatus;

	private String pcontent;
	private String pdate;
	private String pstartdate;
	private String penddate;
	
	private String type;
	private String keyword;

	private String deptno;
	private String mname;
	private String mrank;
	private String deptname;

//taskVo
	private List<MaintaskDto> maintaskList;
// commonVo ( id, 이름 )
	private List<MemberSimpleVo> memberProjectList;

// 정렬용
	private List<MaintaskSortVo> maintaskSortList;

	@Override
	public String toString() {
		return "ProjectVo [pno=" + pno + ", userid=" + userid + ", pname=" + pname + ", paccess=" + paccess + ", prow="
				+ prow + ", countmember=" + countmember + ", pstatus=" + pstatus + ", pcontent=" + "CLOB" + ", pdate="
				+ pdate + ", pstartdate=" + pstartdate + ", penddate=" + penddate + ", type=" + type + ", keyword="
				+ keyword + ", deptno=" + deptno + ", mname=" + mname + ", mrank=" + mrank + ", deptname=" + deptname
				+ ", maintaskList=" + maintaskList + ", memberProjectList=" + memberProjectList + ", maintaskSortList="
				+ maintaskSortList + "]";
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

	public String getPaccess() {
		return paccess;
	}

	public void setPaccess(String paccess) {
		this.paccess = paccess;
	}

	public String getProw() {
		return prow;
	}

	public void setProw(String prow) {
		this.prow = prow;
	}

	public String getCountmember() {
		return countmember;
	}

	public void setCountmember(String countmember) {
		this.countmember = countmember;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDeptno() {
		return deptno;
	}

	public void setDeptno(String deptno) {
		this.deptno = deptno;
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

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public List<MaintaskDto> getMaintaskList() {
		return maintaskList;
	}

	public void setMaintaskList(List<MaintaskDto> maintaskList) {
		this.maintaskList = maintaskList;
	}

	public List<MemberSimpleVo> getMemberProjectList() {
		return memberProjectList;
	}

	public void setMemberProjectList(List<MemberSimpleVo> memberProjectList) {
		this.memberProjectList = memberProjectList;
	}

	public List<MaintaskSortVo> getMaintaskSortList() {
		return maintaskSortList;
	}

	public void setMaintaskSortList(List<MaintaskSortVo> maintaskSortList) {
		this.maintaskSortList = maintaskSortList;
	}
}