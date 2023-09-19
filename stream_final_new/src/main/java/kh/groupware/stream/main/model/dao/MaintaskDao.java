package kh.groupware.stream.main.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.project.model.vo.ProjectVo;

@Repository
public class MaintaskDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ProjectVo> projectNameList(){
		return sqlSession.selectList("mainTask.projectNameList");
	}
	
	public int insertTask() {
		return 0;
	}
	
}
