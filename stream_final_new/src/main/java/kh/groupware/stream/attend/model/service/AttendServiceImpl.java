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

	@Override
	public int attendIn(String userid) {
		return attendDao.attendIn(userid);
	}
	
	@Override
	public List<AttendVo> attendList(String userid){
		return attendDao.attendList(userid);
	}
}
