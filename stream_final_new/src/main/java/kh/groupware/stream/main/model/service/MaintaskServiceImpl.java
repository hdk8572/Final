package kh.groupware.stream.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
	public List<PtaskVo> insertInnerTask(PtaskVo vo) {
		List<PtaskVo> result = null;
		int insertResult = maintaskDao.insertInnerTask(vo);
		if(insertResult > 0) {
			result = ptaskDao.pselectList(vo.getPno());
		}
        return result;
	}

}
