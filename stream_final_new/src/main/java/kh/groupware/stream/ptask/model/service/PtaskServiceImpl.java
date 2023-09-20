package kh.groupware.stream.ptask.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.ptask.model.PtaskDao;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Service
public class PtaskServiceImpl implements PtaskService {

	@Autowired
	private PtaskDao dao;
	
	/*
	 * @Override public List<PtaskVo> selectList() { return dao.selectList(); }
	 */
	
	@Override
	public List<PtaskVo> pselectList(String pno) {
		return dao.pselectList(pno);
	}
	
	@Override
	public int insertTask(PtaskVo vo) {
		return dao.insertTask(vo);
	} 
	
	@Override
    public int deleteTask(String pno) {
    	return dao.deleteTask(pno);
    }
	
}
