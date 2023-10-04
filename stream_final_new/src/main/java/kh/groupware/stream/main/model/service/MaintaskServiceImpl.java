package kh.groupware.stream.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.groupware.stream.main.model.dao.MaintaskDao;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Service
public class MaintaskServiceImpl implements MaintaskService {
	
	@Autowired
	private MaintaskDao maintaskDao;
	
	public List<ProjectVo> projectNameList(String userid){
		return maintaskDao.projectNameList(userid);
	}
	
	@Transactional
	public ProjectVo insertInnerTask(PtaskVo vo) {
		ProjectVo result = null;
		int update = maintaskDao.UpdateBeforeInsertInnerTask(vo);
		int insertResult = maintaskDao.insertInnerTask(vo);
		if(insertResult > 0) {
			result = maintaskDao.projectOneTaskList(vo.getPno());
		}
        return result;
	}

}
