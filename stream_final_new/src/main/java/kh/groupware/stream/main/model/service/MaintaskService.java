package kh.groupware.stream.main.model.service;

import java.security.Principal;
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
	public MemberSimpleVo findMname(String userid);
	
	// 회사 소속 멤버 전체 조회 - 황대경
	public List<MemberSimpleVo> companyMemberList(String userid);
	// 프로젝트의 현재 참가자 조회 - 황대경
	public List<MemberSimpleVo> currentMemberList(String pno);
	
	// 회사 참가자 1명 조회 - 황대경
//	public MemberSimpleVo selectOneMember(String userid);
	
}
