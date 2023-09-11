package kh.groupware.stream.calendar.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.calendar.model.dao.CalendarDao;
import kh.groupware.stream.calendar.model.vo.CalendarVo;

@Service
public class CalendarService {
	
	@Autowired
	private CalendarDao calendarDao;
	
	public List<CalendarVo> selectList() {
		return calendarDao.selectList();
	}
	public int insert(CalendarVo cal) {
		return calendarDao.insert(cal);
	}
	public CalendarVo selectOne(String sno) {
		return calendarDao.selectOne(sno);
	}
	public int update(CalendarVo cal) {
		return calendarDao.update(cal);
	}
	public int delete(String sno) {
		return calendarDao.delete(sno);
	}
}
