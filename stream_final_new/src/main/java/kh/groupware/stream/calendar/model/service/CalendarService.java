package kh.groupware.stream.calendar.model.service;

import java.util.List;
import java.util.Map;

import kh.groupware.stream.calendar.model.vo.CalendarParamVo;
import kh.groupware.stream.calendar.model.vo.CalendarVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;

public interface CalendarService {
	
	public List<CalendarVo> selectList(String pno);
	public CalendarVo selectOne(String sno);
	public List<MemberSimpleVo> memberProjectList(CalendarParamVo pno);
	public int insert(CalendarVo cal);
	public int update(CalendarVo cal);
	public int delete(String sno);
}
