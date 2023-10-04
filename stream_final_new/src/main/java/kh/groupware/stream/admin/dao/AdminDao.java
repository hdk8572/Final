package kh.groupware.stream.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.admin.vo.AdminVo;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<AdminVo> cnt(){
		return sqlSession.selectList("admin.cnt");
	}
}
