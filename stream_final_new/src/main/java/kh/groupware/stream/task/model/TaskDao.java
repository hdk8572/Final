package kh.groupware.stream.task.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.task.model.vo.TaskVo;

@Repository
public class TaskDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<TaskVo> selectList() {
		return sqlSession.selectList("task.selectList");
	}
	
	public TaskVo selectOne(String pno) {
		return sqlSession.selectOne("task.selectOne", pno);
	}
	
}
