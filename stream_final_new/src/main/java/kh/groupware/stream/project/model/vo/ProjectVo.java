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
	private String pcontent;
	private String paccess;
	private String pdate;
	private String pstartdate;
	private String penddate;
	private String prow; // 함수 Vo에 없음
	private String pstatus;

// deptVo + usersVo	
	private String deptno;
	private String mname;
	private String mrank;
	private String deptName;

//taskVo
	private List<MaintaskDto> maintaskList;
// commonVo ( id, 이름 )
	private List<MemberSimpleVo> memberProjectList;

// 정렬용
	private List<MaintaskSortVo> maintaskSortList;

	





	@Override
	public String toString() {
		return "ProjectVo [pno=" + pno + ", userid=" + userid + ", pname=" + pname + ", pcontent=" + pcontent
				+ ", paccess=" + paccess + ", pdate=" + pdate + ", pstartdate=" + pstartdate + ", penddate=" + penddate
				+ ", prow=" + prow + ", pstatus=" + pstatus + ", deptno=" + deptno + ", mname=" + mname + ", mrank="
				+ mrank + ", deptName=" + deptName + ", maintaskList=" + maintaskList + ", memberProjectList="
				+ memberProjectList + ", maintaskSortList=" + maintaskSortList + "]";
	}






	public ProjectVo() {
		super();
	}



	


	public ProjectVo(String pno, String userid, String pname, String pcontent, String paccess, String pdate,
			String pstartdate, String penddate, String prow, String pstatus, String deptno, String mname, String mrank,
			String deptName, List<MaintaskDto> maintaskList, List<MemberSimpleVo> memberProjectList) {
		super();
		this.pno = pno;
		this.userid = userid;
		this.pname = pname;
		this.pcontent = pcontent;
		this.paccess = paccess;
		this.pdate = pdate;
		this.pstartdate = pstartdate;
		this.penddate = penddate;
		this.prow = prow;
		this.pstatus = pstatus;
		this.deptno = deptno;
		this.mname = mname;
		this.mrank = mrank;
		this.deptName = deptName;
		this.maintaskList = maintaskList;
		this.memberProjectList = memberProjectList;
	}
	
	



	public ProjectVo(String pno, String userid, String pname, String pcontent, String paccess, String pdate,
			String pstartdate, String penddate, String prow, String pstatus, String deptno, String mname, String mrank,
			String deptName, List<MaintaskDto> maintaskList, List<MemberSimpleVo> memberProjectList,
			List<MaintaskSortVo> maintaskSortList) {
		super();
		this.pno = pno;
		this.userid = userid;
		this.pname = pname;
		this.pcontent = pcontent;
		this.paccess = paccess;
		this.pdate = pdate;
		this.pstartdate = pstartdate;
		this.penddate = penddate;
		this.prow = prow;
		this.pstatus = pstatus;
		this.deptno = deptno;
		this.mname = mname;
		this.mrank = mrank;
		this.deptName = deptName;
		this.maintaskList = maintaskList;
		this.memberProjectList = memberProjectList;
		this.maintaskSortList = maintaskSortList;
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

	public String getProw() {
		return prow;
	}

	public void setProw(String prow) {
		this.prow = prow;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
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

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
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