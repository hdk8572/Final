package kh.groupware.stream.ptask.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.groupware.stream.files.model.dao.FileDao;
import kh.groupware.stream.files.model.service.FileService;
import kh.groupware.stream.project.model.vo.PnoTnoParam;
import kh.groupware.stream.ptask.model.dao.PtaskDao;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Service
public class PtaskServiceImpl implements PtaskService {

	@Autowired
	private PtaskDao ptaskDao;
	
	@Autowired
	private FileDao fileDao;
	
	@Override
	public List<PtaskVo> pselectList(String pno) {
		return ptaskDao.pselectList(pno);
	}
	
	@Override
	@Transactional
	public int insertTask(PtaskVo vo) {
		System.out.println("before: " +vo);
		int result = ptaskDao.insertTask(vo);
		System.out.println("after : " +vo);
		
		if(vo.getFilevo().getFpath() != null && !vo.getFilevo().getFpath().equals("")){
            int savedFileId = fileDao.savedFile(vo); 
        }
		return result;
	} 
	
	@Override
    public int deleteTask(String pno) {
    	return ptaskDao.deleteTask(pno);
    }
	
	@Override
	public PtaskVo selectOneInner(PnoTnoParam pnoTnoParam) {
		return ptaskDao.selectOneInner(pnoTnoParam);
	}
	
}
