package kh.groupware.stream.main.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class MaintaskDto {
	private String tno;	//업무 번호
	private String pno;	//프로젝트 번호
	private String userid;	//작성자
	private String tmember;	//담당자
	private String ttitle;	//업무 제목
	private String tcontent;//업무 내용
	private String tstatus;	//업무 진행 상태
	private Date tdate;		//작성일
	private Date tstartdate;//업무 시작일
	private Date tenddate;	//업무 마감일
	
	//하위 업무 추가를 위한 컬럼
	private String bref;	//bref=tno : 원본글
	private String brelevel;//0 : 원본 1 : 하위 업무
	private String brestep;	//하위 업무들간의 순서
	
	@Override
	public String toString() {
		return "MaintaskDto [tno=" + tno + ", pno=" + pno + ", userid=" + userid + ", tmember=" + tmember + ", ttitle="
				+ ttitle + ", tcontent=" + tcontent + ", tstatus=" + tstatus + ", tdate=" + tdate + ", tstartdate="
				+ tstartdate + ", tenddate=" + tenddate + ", bref=" + bref + ", brelevel=" + brelevel + ", brestep="
				+ brestep + "]";
	}
	

	public MaintaskDto() {
		super();
	}


	public MaintaskDto(String tno, String pno, String userid, String tmember, String ttitle, String tcontent,
			String tstatus, Date tdate, Date tstartdate, Date tenddate, String bref, String brelevel, String brestep) {
		super();
		this.tno = tno;
		this.pno = pno;
		this.userid = userid;
		this.tmember = tmember;
		this.ttitle = ttitle;
		this.tcontent = tcontent;
		this.tstatus = tstatus;
		this.tdate = tdate;
		this.tstartdate = tstartdate;
		this.tenddate = tenddate;
		this.bref = bref;
		this.brelevel = brelevel;
		this.brestep = brestep;
	}
	
	
	
	
	
	

}
