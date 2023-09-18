package kh.groupware.stream.project.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.groupware.stream.project.model.dao.ProjectDao;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.PtaskDao;

@Service
public class ProjectService {

	@Autowired
	private ProjectDao dao;

	@Autowired
	private PtaskDao ptaskdao;
	
	public List<ProjectVo> selectList() {
		return dao.selectList();
	}
	
    public List<ProjectVo> insertList(ProjectVo vo) {
        int result = dao.insertList(vo);
        if (result > 0) {
            return dao.selectList(); // DB에 삽입 후 리스트를 다시 조회하여 반환합니다.
        } else {
        	return null;
        }
    }
    
    @Transactional
    public int deleteList(String pno) {
    	ptaskdao.deleteTask(pno);
    	return dao.deleteList(pno);
    }
    
    public int update(ProjectVo vo) {
    	return dao.update(vo);
    }
    
    
}