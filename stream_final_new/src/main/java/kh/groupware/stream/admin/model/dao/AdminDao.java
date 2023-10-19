package kh.groupware.stream.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.admin.model.vo.AdminVo;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public AdminVo cnt(){
		return sqlSession.selectOne("admin.cnt");
	}
}
