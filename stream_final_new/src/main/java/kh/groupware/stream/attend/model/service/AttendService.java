package kh.groupware.stream.attend.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kh.groupware.stream.attend.model.dao.AttendDao;
import kh.groupware.stream.attend.model.vo.AttendVo;

public interface AttendService {

	public int attendIn(AttendVo avo);
	public List<AttendVo> attendList(String userid);
	public int checkDate(AttendVo avo);
	public int attendUpdate(AttendVo avo);
	public int workHour(AttendVo avo);
}
