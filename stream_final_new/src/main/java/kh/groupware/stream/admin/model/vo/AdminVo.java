package kh.groupware.stream.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class AdminVo {
	
	private String ucnt;
	private String ccnt;
	private String pcnt;
	private String tcnt;
	
	private String ccode;
	private String cname;
	private String deptno;
	private String deptname;
	
	private String pstatus;
	private String countforpiechart;
	
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
