package kh.groupware.stream.main.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.groupware.stream.project.model.vo.ProjectVo;

@Service
public interface MaintaskService {
	
	public List<ProjectVo> projectNameList();
}
