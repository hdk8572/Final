package kh.groupware.stream.attend.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.attend.model.dao.AttendDao;
import kh.groupware.stream.attend.model.vo.AttendVo;

@Service
public class AttendServiceImpl implements AttendService {

	@Autowired
	private AttendDao attendDao;

	// 근태리스트
	@Override
	public List<AttendVo> attendList(String userid) {
		return attendDao.attendList(userid);
	}

	// 근태 출근
	@Override
	public int attendIn(AttendVo avo) {
		return attendDao.attendIn(avo);
	}

	// attend 값 중복
	@Override
	public int checkDate(AttendVo avo) {
		return attendDao.checkDate(avo);
	}

	// 근태 퇴근
	@Override
	public int attendUpdate(AttendVo avo) {
		return attendDao.attendUpdate(avo);
	}

	// 근무 시간 계산
	@Override
	public int workHour(AttendVo avo) {
		return attendDao.workHour(avo);
	}
}
