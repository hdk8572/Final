package kh.groupware.stream.main.model.service;

import java.security.Principal;
import java.util.List;

import kh.groupware.stream.main.model.dto.MaintaskSortVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

public interface MaintaskService {
	
	/* 프로젝트, 업무 전체 목록 조회 */
	public List<ProjectVo> projectNameList(String userid);
	/* 하위업무 추가 */
	public ProjectVo insertInnerTask(PtaskVo vo);
	/* 하위업무 추가를 위한 프로젝트 참가자 표시 */
	public List<MemberSimpleVo> projectMemberList(String pno);
	/* 업무 정렬버튼 기준 업무 조회 */
	public List<ProjectVo> TaskSortList(MaintaskSortVo vo);
	/* 로그인한 유저 이름 조회 */
	public MemberSimpleVo findMname(String userid);
	
	// 회사 소속 멤버 전체 조회(참가자) - 황대경
	public List<MemberSimpleVo> companyMemberList(String userid);
	// 프로젝트의 현재 참가자 조회(참가자) - 황대경
	public List<MemberSimpleVo> currentMemberList(String pno);
	
	// 프로젝트의 현재 참가자 전체 삭제(참가자) - 황대경
	public int deleteAllCurrentMember(String pno);
	
	// 회사 참가자 1명 조회 - 황대경
//	public MemberSimpleVo selectOneMember(String userid);
	
}
