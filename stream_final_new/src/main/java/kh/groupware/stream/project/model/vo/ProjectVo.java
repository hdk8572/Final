package kh.groupware.stream.project.model.vo;

import java.util.List;

import kh.groupware.stream.main.model.dto.MaintaskDto;
import kh.groupware.stream.ptask.model.vo.PtaskVo;
import lombok.Data;

@Data
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
	private List<PtaskVo> maintaskList;
	
}
