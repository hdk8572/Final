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
	
	//캘린더 전체 조회
	public List<CalendarVo> selectList(CalendarParamVo paramvo) throws Exception{
		return sqlSession.selectList("calendar.selectList", paramvo);
	}
	//캘린더 일정 상세 조회
	public CalendarVo selectOne(String sno) throws Exception{
		return sqlSession.selectOne("calendar.selectOne",sno);
	}
	
	//참석자 list
	public List<MemberSimpleVo> memberProjectList(CalendarParamVo pno) throws Exception{
		System.out.println("[j22]"+ pno);
		return sqlSession.selectList("calendar.memberProjectList", pno);
	}
	
	//캘린더 등록
	public int insert(CalendarVo cal) throws Exception{
		System.out.println("[jy]"+ cal);
		return sqlSession.insert("calendar.insert", cal);
	}
	
	//참석자 등록 
	public int insertMember(Map<String, Object> map) throws Exception{
		return sqlSession.insert("calendar. insert");
	}
	
	//캘린더 수정
	public int updateCalendar(CalendarVo cal) throws Exception{
		return sqlSession.update("calendar.updateCalendar", cal);
	}
	
	//참가자 부분 수정
	public int insertAttenduseridArr(CalendarVo cal) throws Exception{
		return sqlSession.update("calendar.insertAttenduseridArr", cal);
	}
	
	//캘린더 삭제
	public int deleteCalendar(String sno) throws Exception{
		return sqlSession.delete("calendar.deleteCalendar",sno);
	}
	
	//참가자 부분 삭제
	public int deletemember(String sno) throws Exception{
		return sqlSession.delete("calendar.deletemember",sno);
	}

}
