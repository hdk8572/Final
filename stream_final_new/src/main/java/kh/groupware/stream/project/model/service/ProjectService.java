package kh.groupware.stream.project.model.service;

import java.security.Principal;
import java.util.List;

import kh.groupware.stream.project.model.vo.PnoPrincipalParam;
import kh.groupware.stream.project.model.vo.ProjectVo;

public interface ProjectService {
	
	public List<ProjectVo> selectList(String userid);
	public List<ProjectVo> selectHide(String userid);
	/* public ProjectVo selectOne(ProjectVo vo); */
	public ProjectVo selectOne(PnoPrincipalParam pnoPrincipalParam);
    public List<ProjectVo> insertList(ProjectVo vo, String userid);
    public int delete(String pno);
    public int update(ProjectVo vo);
}
