package kh.groupware.stream.calendar.model.service;

import java.util.List;

import kh.groupware.stream.calendar.model.vo.CalendarVo;

public interface CalendarService {
	
	public List<CalendarVo> selectList();
	public CalendarVo selectOne(String sno);
	public int insert(CalendarVo cal);
	public int update(CalendarVo cal);
	public int delete(String sno);
	public List<CalendarVo> attendList();
}
