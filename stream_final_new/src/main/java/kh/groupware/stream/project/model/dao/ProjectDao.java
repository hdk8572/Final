package kh.groupware.stream.project.model.dao;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.project.model.vo.PnoPrincipalParam;
import kh.groupware.stream.project.model.vo.ProjectInsertParamVo;
import kh.groupware.stream.project.model.vo.ProjectVo;

@Repository
public class ProjectDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<ProjectVo> selectList(String userid) {
		return sqlSession.selectList("project.selectList", userid);
	}
	
	public List<ProjectVo> selectHide(String userid) {
		return sqlSession.selectList("project.selectHide", userid);
	}

	public ProjectVo selectOne(PnoPrincipalParam pnoPrincipalParam) {
		return sqlSession.selectOne("project.selectOne", pnoPrincipalParam);
	}
	
	public ProjectVo sessionPname(String pno) {
		return sqlSession.selectOne("project.sessionPname", pno);
	}
	
	public int insertList(ProjectInsertParamVo vo) {
		return sqlSession.insert("project.insertList", vo);
	}
	public int insertMemberProjectForUpdate(ProjectInsertParamVo vo) {
		return sqlSession.insert("project.insertMemberProjectForUpdate", vo);
	}
	
	public int deleteList(String pno) {
		return sqlSession.delete("project.deleteList", pno);
	}
	
	public int update(ProjectInsertParamVo vo) {
		return sqlSession.update("project.updateList", vo);
	}
	public int updateHide(PnoPrincipalParam vo) {
		return sqlSession.update("project.updateHide", vo);
	}
	
	public List<ProjectVo> searchProjectList(ProjectVo vo) {
		return sqlSession.selectList("project.searchProjectList", vo);
	}
	
	// 로그인 한 계정 정보 조회 - 황대경
	public ProjectVo loginUser(String userid) {
		return sqlSession.selectOne("project.loingUser", userid);
	}
	
}
