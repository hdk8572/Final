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
public class MaintaskServiceImpl implements MaintaskService {
	
	@Autowired
	private MaintaskDao maintaskDao;
	
	public List<ProjectVo> projectNameList(String userid){
		return maintaskDao.projectNameList(userid);
	}
	
	@Transactional
	public ProjectVo insertInnerTask(PtaskVo vo) {
		ProjectVo result = null;
		int update = maintaskDao.UpdateBeforeInsertInnerTask(vo);
		int insertResult = maintaskDao.insertInnerTask(vo);
		if(insertResult > 0) {
			result = maintaskDao.projectOneTaskList(vo);
		}
        return result;
	}
	
	public List<MemberSimpleVo> projectMemberList(String pno){
		return maintaskDao.projectMemberList(pno);
	}
	
	public List<ProjectVo> TaskSortList(MaintaskSortVo vo){
		return maintaskDao.TaskSortList(vo);
	}
	
	public MemberSimpleVo findMname(String userid) {
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
	
	// 회사 소속 멤버 전체 조회 - 황대경
	public List<MemberSimpleVo> companyMemberList(String userid) {
		return maintaskDao.companyMemberList(userid);
	}

	// 프로젝트의 현재 참가자 조회 - 황대경
	public List<MemberSimpleVo> currentMemberList(String pno) {
		return maintaskDao.currentMemberList(pno);
	}
	
	// 회사 참가자 1명 조회 - 황대경
//	public MemberSimpleVo selectOneMember(String userid) {
//		return maintaskDao.selectOneMember(userid);
//	}
	
}
