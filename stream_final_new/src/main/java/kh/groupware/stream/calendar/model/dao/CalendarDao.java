package kh.groupware.stream.calendar.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.calendar.model.vo.CalendarVo;

@Repository
public class CalendarDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//캘린더 조회
	public List<CalendarVo> selectList() {
		return sqlSession.selectList("calendar.selectList");
	}
	
	//캘린더 등록
	public int insert(CalendarVo cal) {
		return sqlSession.insert("calendar.insert", cal);
	}
	
	//캘린더 일정상세 조회
	public CalendarVo selectOne(String sno) {
		return sqlSession.selectOne("calendar.selectOne",sno);
	}
	
	//캘린더 수정
	public int update(CalendarVo cal) {
		return sqlSession.update("calendar.update", cal);
	}
	
	//캘린더 삭제
	public int delete(String sno) {
		return sqlSession.delete("calendar.delete",sno);
	}

}
