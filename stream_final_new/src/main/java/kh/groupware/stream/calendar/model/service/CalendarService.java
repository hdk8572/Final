package kh.groupware.stream.calendar.model.service;

import java.util.List;
import java.util.Map;

import kh.groupware.stream.calendar.model.vo.CalendarParamVo;
import kh.groupware.stream.calendar.model.vo.CalendarVo;
import kh.groupware.stream.member.model.vo.MemberSimpleVo;

public interface CalendarService {
	
	public List<CalendarVo> selectList(CalendarParamVo paramvo); //캘린더 조회
	public CalendarVo selectOne(String sno);	//캘린더 일정 상세 조회
	public List<MemberSimpleVo> memberProjectList(CalendarParamVo pno);	//참석자 조회
	public int isAttendedProject(Map<String, String> map);	//프로젝트에 참여중인 사람인지 확인
	public int insert(CalendarVo cal);	//캘린더 등록
	public int update(String sno);	//캘린더 수정
	public int delete(String sno);		//캘린더 삭제
	
	
}
