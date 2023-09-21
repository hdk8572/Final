package kh.groupware.stream.calendar.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.calendar.model.dao.CalendarDao;
import kh.groupware.stream.calendar.model.vo.CalendarParamVo;
import kh.groupware.stream.calendar.model.vo.CalendarVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;

//Impl - 인터페이스
@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDao calendarDao;
	
	//캘린더 조회
	@Override
	public List<CalendarVo> selectList() {
		return calendarDao.selectList();
	}
	//캘린더 일정 상세조회
	@Override
	public CalendarVo selectOne(String sno) {
		return calendarDao.selectOne(sno);
	}
	//캘린더 등록
	@Override
	public int insert(CalendarVo cal) {
		return calendarDao.insert(cal);
	}
	//캘린더 수정
	@Override
	public int update(CalendarVo cal) {
		return calendarDao.update(cal);
	}
	//캘린더 삭제
	@Override
	public int delete(String sno) {
		return calendarDao.delete(sno);
	}
	//참석자조회
	@Override
	public List<CalendarVo> attendList() {
		return calendarDao.attendList();
	}
	@Override
	public List<MemberSimpleVo> memberProjectList(CalendarParamVo pno) {
		return calendarDao.memberProjectList(pno);
	}

}
