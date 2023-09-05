package kh.groupware.stream.task.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.task.model.TaskDao;
import kh.groupware.stream.task.model.vo.TaskVo;

@Service
public class TaskService {

	@Autowired
	private TaskDao dao;
	
	public List<TaskVo> selectList() {
		return dao.selectList();
	}
	
	public TaskVo selectOne(String pno) {
		return dao.selectOne(pno);
	}
}
