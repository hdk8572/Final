package kh.groupware.stream.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class ProjectStatusCountVo {
	private String pstatus;	//프로젝트 진행 상태
	private String pcolor;	//프로젝트 진행 상태
	private String countforpiechart;//회사별 프로젝트 숫자 카운트
	@Override
	public String toString() {
		return "ProjectStatusVo [pstatus=" + pstatus + ", countforpiechart=" + countforpiechart + "]";
	}
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
		
		switch (this.pstatus){
		case "진행":
			this.pcolor = "#dee2e6";
			break;
		case "미진행":
			this.pcolor = "#2ee2e6";
			break;
		case "보류":
			this.pcolor = "#de62e6";
			break;
		case "숨김":
			this.pcolor = "#000000";
			break;
		default:
			this.pcolor = "#fffffa";
			break;
		}
	}
	public String getCountforpiechart() {
		return countforpiechart;
	}
	public void setCountforpiechart(String countforpiechart) {
		this.countforpiechart = countforpiechart;
	}
	public String getPcolor() {
		return pcolor;
	}

	
}
