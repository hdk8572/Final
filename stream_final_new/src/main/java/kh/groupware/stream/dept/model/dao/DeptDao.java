package kh.groupware.stream.dept.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.dept.model.vo.DeptVo;

@Repository
public class DeptDao {

	@Autowired
	private SqlSession sqlSession;
	
	//회사코드로 부서찾기
	public List<DeptVo> deptList(String ccode) {
		return sqlSession.selectList("department.deptList", ccode);
	}
}
