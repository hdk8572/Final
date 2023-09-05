package kh.groupware.stream.project.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.project.model.dao.ProjectDao;
import kh.groupware.stream.project.model.vo.ProjectVo;

@Service
public class ProjectService {

	@Autowired
	private ProjectDao dao;
	
	public List<ProjectVo> selectList() {
		return dao.selectList();
	}
	
}
