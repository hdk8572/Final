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
	
	
	//캘린더 등록 //insert:캘린더 정보를 db에 추가 //insertMember:참가자 정보를 db에 추가
	//override밑에 Transactional주석처리
	@Override
	public int insert(CalendarVo cal) {
		int result = 0;
		result += calendarDao.insert(cal);
		System.out.println("selectKey ");
		System.out.println(cal);
		
		/*
		 * for(int i=0; i<cal.getAttenuseridList().size(); i++) { //반복해서 각 참가자를 DB에
		 * 등록한다. Map<String, Object> map = new HashMap<String, Object>(); //map 객체에 담는다.
		 * map.put("sno", cal.getSno()); //selectKey를사용한 값
		 * map.put("attenuserid",cal.getAttenuseridList().get(i)); result +=
		 * calendarDao.insertMember(map); }
		 */
		return result; 
	}


	@Override
	public List<MemberSimpleVo> memberProjectList(CalendarParamVo pno) {
		return calendarDao.memberProjectList(pno);
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



}
