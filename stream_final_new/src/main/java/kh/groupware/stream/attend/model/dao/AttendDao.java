package kh.groupware.stream.attend.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttendDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 출근
	public int attendIn(String userid) {
		return sqlSession.insert("attend.attendIn", userid);
	}
}
