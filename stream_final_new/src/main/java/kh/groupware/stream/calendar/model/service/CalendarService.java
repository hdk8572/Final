package kh.groupware.stream.calendar.model.service;

import java.util.List;
import java.util.Map;

import kh.groupware.stream.calendar.model.vo.CalendarParamVo;
import kh.groupware.stream.calendar.model.vo.CalendarVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;

public interface CalendarService {
	
	public List<CalendarVo> selectList(CalendarParamVo paramvo) throws Exception; //캘린더 조회
	public CalendarVo selectOne(String sno) throws Exception;	//캘린더 일정 상세 조회
	public List<MemberSimpleVo> memberProjectList(CalendarParamVo pno) throws Exception;	//참석자 조회
	public int insert(CalendarVo cal) throws Exception;	//캘린더 등록
	public int update(CalendarVo cal) throws Exception;	//캘린더 수정
	public int delete(String sno) throws Exception;		//캘린더 삭제
}
