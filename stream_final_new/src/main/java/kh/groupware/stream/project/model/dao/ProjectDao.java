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
	
	
	
}
