package kh.groupware.stream.calendar.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.calendar.model.dao.CalendarDao;
import kh.groupware.stream.calendar.model.vo.CalendarVo;

//Impl - 인터페이스
@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDao calendarDao;
	
	@Override
	public List<CalendarVo> selectList() {
		return calendarDao.selectList();
	}
	@Override
	public CalendarVo selectOne(String sno) {
		return calendarDao.selectOne(sno);
	}
	@Override
	public int insert(CalendarVo cal) {
		return calendarDao.insert(cal);
	}
	@Override
	public int update(CalendarVo cal) {
		return calendarDao.update(cal);
	}
	@Override
	public int delete(String sno) {
		return calendarDao.delete(sno);
	}

}
