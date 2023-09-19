package kh.groupware.stream.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.main.model.dao.MaintaskDao;
import kh.groupware.stream.project.model.vo.ProjectVo;

@Service
public class MaintaskServiceImpl implements MaintaskService {
	
	@Autowired
	private MaintaskDao dao;
	
	public List<ProjectVo> projectNameList(){
		return dao.projectNameList();
	}

}
