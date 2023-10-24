package kh.groupware.stream.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class AdminVo {
	
	private String ucnt;	//사용자 수
	private String ccnt;	//사용 회사 수
	private String pcnt;	//프로젝트 수
	private String tcnt;	//업무 수
	
	private String ccode;	//회사 코드
	private String cname;	//회사명
	private String deptno;	//부서코드
	private String deptname;//부서명
	
	private String pstatus;	//프로젝트 진행 상태
	private String countforpiechart;//회사별 프로젝트 숫자 카운트
	
	@Override
	public String toString() {
		return "AdminVo [ucnt=" + ucnt + ", ccnt=" + ccnt + ", pcnt=" + pcnt + ", tcnt=" + tcnt + ", ccode=" + ccode
				+ ", cname=" + cname + ", deptno=" + deptno + ", deptname=" + deptname + "]";
	}
	public AdminVo() {
		super();
	}
	public AdminVo(String ucnt, String ccnt, String pcnt, String tcnt, String ccode, String cname, String deptno,
			String deptname) {
		super();
		this.ucnt = ucnt;
		this.ccnt = ccnt;
		this.pcnt = pcnt;
		this.tcnt = tcnt;
		this.ccode = ccode;
		this.cname = cname;
		this.deptno = deptno;
		this.deptname = deptname;
	}
	
	public AdminVo(String ccode, String pstatus, String countforpiechart) {
		super();
		this.ccode = ccode;
		this.pstatus = pstatus;
		this.countforpiechart = countforpiechart;
	}
	public String getUcnt() {
		return ucnt;
	}
	public void setUcnt(String ucnt) {
		this.ucnt = ucnt;
	}
	public String getCcnt() {
		return ccnt;
	}
	public void setCcnt(String ccnt) {
		this.ccnt = ccnt;
	}
	public String getPcnt() {
		return pcnt;
	}
	public void setPcnt(String pcnt) {
		this.pcnt = pcnt;
	}
	public String getTcnt() {
		return tcnt;
	}
	public void setTcnt(String tcnt) {
		this.tcnt = tcnt;
	}
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	public String getCountforpiechart() {
		return countforpiechart;
	}
	public void setCountforpiechart(String countforpiechart) {
		this.countforpiechart = countforpiechart;
	}
	
	
}
