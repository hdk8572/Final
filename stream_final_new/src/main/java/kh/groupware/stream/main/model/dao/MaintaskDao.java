package kh.groupware.stream.main.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Repository
public class MaintaskDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ProjectVo> projectNameList(String userid){
		return sqlSession.selectList("mainTask.projectNameList", userid);
	}
	public ProjectVo projectOneTaskList(PtaskVo vo){
		return sqlSession.selectOne("mainTask.projectOneTaskList", vo);
	}
	
	public int insertInnerTask(PtaskVo vo) {
		return sqlSession.insert("mainTask.innerTaskInsert", vo);
	}
	public int UpdateBeforeInsertInnerTask(PtaskVo vo) {
		return sqlSession.update("mainTask.InnerTaskInsertBeforeUpdate", vo);
	}
}
