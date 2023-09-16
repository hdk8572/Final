package kh.groupware.stream.project.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.project.model.vo.ProjectVo;

@Repository
public class ProjectDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ProjectVo> selectList() {
		return sqlSession.selectList("project.selectList");
	}
	
	public int insertList(ProjectVo vo) {
		return sqlSession.insert("project.insertList", vo);
	}
	
	public int deleteList(String pno) {
		return sqlSession.delete("project.deleteList", pno);
	}
	
	public int update(ProjectVo vo) {
		return sqlSession.update("project.update", vo);
	}
}
