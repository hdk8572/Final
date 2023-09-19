package kh.groupware.stream.project.model.service;

import java.util.List;

import kh.groupware.stream.project.model.vo.ProjectVo;

public interface ProjectService {
	
	public List<ProjectVo> selectList(); 
    public List<ProjectVo> insertList(ProjectVo vo);
    public int deleteList(String pno);
    public int update(ProjectVo vo);
}
