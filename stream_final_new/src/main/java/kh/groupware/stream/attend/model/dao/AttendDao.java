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
	public int attendIn(AttendVo avo) {
		return sqlSession.insert("attend.attendIn", avo);
	}

	// 근태리스트
	public List<AttendVo> attendList(String userid) {
		return sqlSession.selectList("attend.attendList", userid);
	}
	
	//퇴근
	public int attendUpdate(AttendVo avo) {
		return sqlSession.update("attend.attendUpdate", avo);
	}
	
	//attend 값 중복
	public int checkDate(AttendVo avo) {
		return sqlSession.selectOne("attend.checkDate", avo);
	}

	public int workHour(AttendVo avo) {
		return sqlSession.update("attend.workHour", avo);
	}
}
