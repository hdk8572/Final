package kh.groupware.stream.attend.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.attend.model.vo.AttendVo;

@Repository
public class AttendDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 출근
	public int attendIn(String userid) {
		return sqlSession.insert("attend.attendIn", userid);
	}
	// 근태리스트
	public List<AttendVo> attendList(String userid){
		return sqlSession.selectList("attend.attendList", userid);
	}
}
