package kh.groupware.stream.ptask.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.ptask.model.PtaskDao;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Service
public class PtaskService {

	@Autowired
	private PtaskDao dao;
	
	public List<PtaskVo> selectList() {
		return dao.selectList();
	}
	
	public List<PtaskVo> pselectList(String pno) {
		return dao.pselectList(pno);
	}
	
	public int insertTask(PtaskVo vo) {
		return dao.insertTask(vo);
	} 
	
    public int deleteTask(String pno) {
    	return dao.deleteTask(pno);
    }
	
	
}
