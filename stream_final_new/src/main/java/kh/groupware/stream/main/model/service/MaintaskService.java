package kh.groupware.stream.main.model.service;

import java.util.List;

import kh.groupware.stream.main.model.dto.MaintaskSortVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

public interface MaintaskService {
	
	public List<ProjectVo> projectNameList(String userid);
	public ProjectVo insertInnerTask(PtaskVo vo);
	public List<MemberSimpleVo> projectMemberList(String pno);
	public List<ProjectVo> TaskSortList(MaintaskSortVo vo);
}
