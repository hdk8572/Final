package kh.groupware.stream.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.main.model.dao.MaintaskDao;
import kh.groupware.stream.main.model.vo.MaintaskVo;

@Service
public class MaintastService {
	
	@Autowired
	private MaintaskDao dao;
	
	public List<MaintaskVo> projectNameList(){
		return dao.projectNameList();
	}
	
	/*
	 * public List<MaintaskVo> taskList(){ return dao.taskList(); }
	 */

}
