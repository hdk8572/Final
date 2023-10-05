package kh.groupware.stream.project.model.service;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.groupware.stream.project.model.dao.ProjectDao;
import kh.groupware.stream.project.model.vo.PnoPrincipalParam;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.dao.PtaskDao;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDao projectDao;

	@Autowired
	private PtaskDao ptaskdao;
	
	@Override
	public List<ProjectVo> selectList(String userid) {
		return projectDao.selectList(userid);
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
		return projectDao.selectOne(pnoPrincipalParam);
	}
	
	@Override
	@Transactional
    public List<ProjectVo> insertList(ProjectVo vo, String userid) {
        int result = projectDao.insertList(vo);
        if (result > 0) {
            return projectDao.selectList(userid); // DB에 삽입 후 리스트를 다시 조회하여 반환합니다.
        } else {
        	return null;
        }
    }
    
	@Override
    @Transactional
    public int delete(String pno) {
    	ptaskdao.deleteTask(pno);
    	return projectDao.deleteList(pno);
    }
    
	@Override
    public int update(ProjectVo vo) {
    	return projectDao.update(vo);
    }
	
}