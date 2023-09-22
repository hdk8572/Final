package kh.groupware.stream.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.groupware.stream.main.model.dao.MaintaskDao;
import kh.groupware.stream.project.model.dao.ProjectDao;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.PtaskDao;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Service
public class MaintaskServiceImpl implements MaintaskService {
	
	@Autowired
	private MaintaskDao maintaskDao;
	@Autowired
	private PtaskDao ptaskDao;
	
	public List<ProjectVo> projectNameList(){
		return maintaskDao.projectNameList();
	}
	
	@Transactional
	public PtaskVo insertInnerTask(PtaskVo vo) {
		PtaskVo result = null;
		int update = maintaskDao.UpdateBeforeInsertInnerTask(vo);
		int insertResult = maintaskDao.insertInnerTask(vo);
		if(insertResult > 0) {
			result = ptaskDao.pselectOne(vo.getPno(), vo.getTno());
		}
        return result;
	}

}
