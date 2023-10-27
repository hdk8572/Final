package kh.groupware.stream.main.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.main.model.dto.MaintaskSortVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Repository
public class MaintaskDao {

	@Autowired
	private SqlSession sqlSession;

	/* 프로젝트, 업무 전체 목록 조회 */
	public List<ProjectVo> projectNameList(String userid) throws Exception {
		return sqlSession.selectList("mainTask.projectNameList", userid);
	}

	/* 하위업무 추가 후 추가된 프로젝트만 따로 조회 */
	public ProjectVo projectOneTaskList(PtaskVo vo) throws Exception {
		return sqlSession.selectOne("mainTask.projectOneTaskList", vo);
	}

	/* 하위업무 추가 */
	public int insertInnerTask(PtaskVo vo) throws Exception {
		return sqlSession.insert("mainTask.innerTaskInsert", vo);
	}

	/* 하위업무 추가 전처리 (bref 관련 값 변경) */
	public int UpdateBeforeInsertInnerTask(PtaskVo vo) throws Exception {
		return sqlSession.update("mainTask.InnerTaskInsertBeforeUpdate", vo);
	}

	/* 하위업무 추가를 위한 프로젝트 참가자 표시 */
	public List<MemberSimpleVo> projectMemberList(String pno) throws Exception {
		return sqlSession.selectList("mainTask.memberProjectselectOne", pno);
	}

	/* 업무 정렬버튼 기준 업무 조회 */
	public List<ProjectVo> TaskSortList(MaintaskSortVo vo) throws Exception {
		return sqlSession.selectList("mainTask.taskSortedList", vo);
	}

	/* 로그인한 유저 이름 조회 */
	public MemberSimpleVo findMname(String userid) throws Exception {
		return sqlSession.selectOne("mainTask.selectMname", userid);
	}

	// 회사 소속 멤버 전체 조회(참가자) - 황대경
	public List<MemberSimpleVo> companyMemberList(String userid) throws Exception {
		return sqlSession.selectList("mainTask.companyMemberList", userid);
	}
	
	// 프로젝트의 현재 참가자 조회(참가자) - 황대경
	public List<MemberSimpleVo> currentMemberList(String pno) throws Exception {
		return sqlSession.selectList("mainTask.currentMemberList", pno);
	}
	
	// 프로젝트의 현재 참가자 전체 삭제(참가자) - 황대경
	public int deleteAllCurrentMember(String pno) throws Exception {
		return sqlSession.delete("mainTask.deleteAllCurrentMember", pno);
	}

	// 회사 참가자 1명 조회 - 황대경
//	public MemberSimpleVo selectOneMember(String userid) {
//		return sqlSession.selectOne("mainTask.companyMemberOne", userid);
//	}

}
