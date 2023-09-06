package kh.groupware.stream.ptask.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Repository
public class PtaskDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<PtaskVo> selectList() {
		return sqlSession.selectList("task.selectList");
	}
	
	public PtaskVo selectOne(String pno) {
		return sqlSession.selectOne("task.selectOne", pno);
	}
	
}
