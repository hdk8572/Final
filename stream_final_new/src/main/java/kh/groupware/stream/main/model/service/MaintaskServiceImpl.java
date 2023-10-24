package kh.groupware.stream.main.model.service;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.groupware.stream.main.model.dao.MaintaskDao;
import kh.groupware.stream.main.model.dto.MaintaskSortVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Service
public class MaintaskServiceImpl implements MaintaskService  {
	
	@Autowired
	private MaintaskDao maintaskDao;
	/* 프로젝트, 업무 전체 목록 조회 */
	public List<ProjectVo> projectNameList(String userid) throws Exception{
		return maintaskDao.projectNameList(userid);
	}
	
	/* 하위업무 추가 */
	@Transactional
	public ProjectVo insertInnerTask(PtaskVo vo) throws Exception {
		ProjectVo result = null;
		int update = maintaskDao.UpdateBeforeInsertInnerTask(vo);
		int insertResult = maintaskDao.insertInnerTask(vo);
		if(insertResult > 0) {
			result = maintaskDao.projectOneTaskList(vo);
		}
        return result;
	}
	/* 하위업무 추가를 위한 프로젝트 참가자 표시 */
	public List<MemberSimpleVo> projectMemberList(String pno) throws Exception{
		return maintaskDao.projectMemberList(pno);
	}
	/* 업무 정렬버튼 기준 업무 조회 */
	public List<ProjectVo> TaskSortList(MaintaskSortVo vo) throws Exception{
		return maintaskDao.TaskSortList(vo);
	}
	/* 로그인한 유저 이름 조회 */	
	public MemberSimpleVo findMname(String userid) throws Exception {
		return maintaskDao.findMname(userid);
	}
	
	/*
	public List<ProjectVo> TaskSortList(String userid, String ordertype) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(ordertype, ordertype);
		map.put(userid, userid);
		return maintaskDao.TaskSortList(userid, ordertype);
	}
	*/
	
	// 회사 소속 멤버 전체 조회(참가자) - 황대경
	public List<MemberSimpleVo> companyMemberList(String userid) throws Exception {
		return maintaskDao.companyMemberList(userid);
	}

	// 프로젝트의 현재 참가자 조회(참가자) - 황대경
	public List<MemberSimpleVo> currentMemberList(String pno) throws Exception {
		return maintaskDao.currentMemberList(pno);
	}
	
	// 프로젝트의 현재 참가자 전체 삭제(참가자) - 황대경
	public int deleteAllCurrentMember(String pno) throws Exception {
		return maintaskDao.deleteAllCurrentMember(pno);
	}
	
	// 회사 참가자 1명 조회 - 황대경
//	public MemberSimpleVo selectOneMember(String userid) {
//		return maintaskDao.selectOneMember(userid);
//	}
	
}
