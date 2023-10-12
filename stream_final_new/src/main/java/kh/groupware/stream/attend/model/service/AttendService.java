package kh.groupware.stream.attend.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import kh.groupware.stream.attend.model.dao.AttendDao;

public interface AttendService {
	
	public int attendIn(String userid);
}
