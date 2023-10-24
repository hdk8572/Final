package kh.groupware.stream.project.model.service;

import java.util.List;

import kh.groupware.stream.project.model.vo.PnoPrincipalParam;
import kh.groupware.stream.project.model.vo.ProjectInsertParamVo;
import kh.groupware.stream.project.model.vo.ProjectVo;

public interface ProjectService {
	
	public List<ProjectVo> selectList(String userid);

	// 프로젝트의 작성자
//	public ProjectVo selectProjectInfo(String pno);
	public List<ProjectVo> selectHide(String userid);
	
	public ProjectVo sessionPname(String pno);
	
	/* public ProjectVo selectOne(ProjectVo vo); */
	public ProjectVo selectOne(PnoPrincipalParam pnoPrincipalParam);
    public List<ProjectVo> insertList(ProjectInsertParamVo vo);
//    public int delete(String pno);
    public int update(ProjectInsertParamVo vo);
    public int updateHide(PnoPrincipalParam vo);
    
    
	public List<ProjectVo> searchProjectList(ProjectVo vo, String userid);
	
	// 로그인 한 계정 정보 조회 - 황대경
	public ProjectVo loginUser(String userid);
}
