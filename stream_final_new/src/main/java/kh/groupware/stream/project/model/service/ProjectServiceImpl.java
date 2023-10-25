package kh.groupware.stream.project.model.service;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.groupware.stream.main.model.dao.MaintaskDao;
import kh.groupware.stream.project.model.dao.ProjectDao;
import kh.groupware.stream.project.model.vo.PnoPrincipalParam;
import kh.groupware.stream.project.model.vo.ProjectInsertParamVo;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.dao.PtaskDao;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDao projectDao;

	@Autowired
	private PtaskDao ptaskdao;
	
	@Autowired
	private MaintaskDao maintaskDao;
	
	@Override
	public List<ProjectVo> selectList(String userid) {
		return projectDao.selectList(userid);
	}
	
	// 프로젝트의 작성자
//	@Override
//	public ProjectVo selectProjectInfo(String pno) {
//		return projectDao.selectProjectInfo(pno);
//	}
	
	@Override
	public ProjectVo sessionPname(String pno) {
		return projectDao.sessionPname(pno);
	}
	
	@Override
	public List<ProjectVo> selectHide(String userid) {
		return projectDao.selectHide(userid);
	}
	
	/*
	 * @Override public ProjectVo selectOne(ProjectVo vo) { return
	 * projectDao.selectOne(vo); }
	 */
	
	@Override
	public ProjectVo selectOne(PnoPrincipalParam pnoPrincipalParam) {
		ProjectVo result = projectDao.selectOne(pnoPrincipalParam);
		System.out.println("ServiceImpl result :"+result);
		return result;
	}
	
	@Override
	@Transactional
    public List<ProjectVo> insertList(ProjectInsertParamVo vo) {
        int result = projectDao.insertList(vo);
        if (result > 0) {
            return projectDao.selectList(vo.getUserid()); // DB에 삽입 후 리스트를 다시 조회하여 반환합니다.
        } else {
        	return null;
        }
    }
    
//	@Override
//    @Transactional
//    public int delete(String pno) {
//    	ptaskdao.deleteTask(pno);
//    	return projectDao.deleteList(pno);
//    }
    
	@Override
	@Transactional
    public int update(ProjectInsertParamVo vo) throws Exception {
		int result = projectDao.update(vo);
		maintaskDao.deleteAllCurrentMember(vo.getPno());
    	projectDao.insertMemberProjectForUpdate(vo);
    	return result;
    }
	@Override
	public int updateHide(PnoPrincipalParam vo) {
		return projectDao.updateHide(vo);
	}
	
	@Override
	@Transactional
	public List<ProjectVo> searchProjectList(ProjectVo vo, String userid) {
		projectDao.selectList(userid);
		return projectDao.searchProjectList(vo);
	}

	// 로그인 한 계정 정보 조회 - 황대경
	@Override
	public ProjectVo loginUser(String userid) {
		return projectDao.loginUser(userid);
	}
	
	
}