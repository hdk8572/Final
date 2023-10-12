package kh.groupware.stream.attend.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.attend.model.dao.AttendDao;

@Service
public class AttendServiceImpl implements AttendService {

	@Autowired
	private AttendDao attendDao;

	@Override
	public int attendIn(String userid) {
		return attendDao.attendIn(userid);
	}
	
}
