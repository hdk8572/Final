package kh.groupware.stream.dept.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.dept.model.vo.DeptVo;

@Repository
public class DeptDao {

	//부서조회
	@Autowired
	private SqlSession sqlSession;
	
	public List<DeptVo> deptList(String ccode) {
		return sqlSession.selectList("department.deptList", ccode);
	}
}
