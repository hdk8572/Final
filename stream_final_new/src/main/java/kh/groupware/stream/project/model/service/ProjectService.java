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
	
    public List<ProjectVo> insertList(ProjectVo vo) {
        int result = dao.insertList(vo);
        if (result > 0) {
            return dao.selectList(); // DB에 삽입 후 리스트를 다시 조회하여 반환합니다.
        } else {
        	return null;
        }
    }
}