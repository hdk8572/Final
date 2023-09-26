package kh.groupware.stream.project.model.service;

import java.util.List;

import kh.groupware.stream.project.model.vo.ProjectVo;

public interface ProjectService {
	
	public List<ProjectVo> selectList(String userid);
	public List<ProjectVo> selectHide();
	public ProjectVo selectOne(String pno);
    public List<ProjectVo> insertList(ProjectVo vo, String userid);
    public int deleteList(String pno);
    public int update(ProjectVo vo);
}
