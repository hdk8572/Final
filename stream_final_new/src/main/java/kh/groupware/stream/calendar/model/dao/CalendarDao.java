package kh.groupware.stream.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.calendar.model.vo.CalendarParamVo;
import kh.groupware.stream.calendar.model.vo.CalendarVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;

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
	//insertMember 참석자 등록
	public int insertMember(Map<String, Object> map) {
		return sqlSession.insert("calendar, insert");
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
	
	//참석자 조회
	public List<CalendarVo> attendList() {
		return sqlSession.selectList("calendar.attendList");
	}
	
	//참석자 조회
	public List<MemberSimpleVo> memberProjectList(CalendarParamVo pno) {
		return sqlSession.selectList("calendar.memberProjectList", pno);
	}

}
