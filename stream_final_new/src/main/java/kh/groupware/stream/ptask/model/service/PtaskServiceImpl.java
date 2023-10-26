package kh.groupware.stream.ptask.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.groupware.stream.files.model.dao.FileDao;
import kh.groupware.stream.files.model.service.FileService;
import kh.groupware.stream.project.model.dao.ProjectDao;
import kh.groupware.stream.project.model.vo.PnoTnoParam;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.dao.PtaskDao;
import kh.groupware.stream.ptask.model.vo.PtaskVo;
import kh.groupware.stream.reply.model.dao.ReplyDao;

@Service
public class PtaskServiceImpl implements PtaskService {

	@Autowired
	private PtaskDao ptaskDao;
	
	@Autowired
	private FileDao fileDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public List<PtaskVo> pselectList(String pno) {
		return ptaskDao.pselectList(pno);
	}
	
	@Override
	@Transactional
	public int insertTask(PtaskVo vo) {
		System.out.println("before: " +vo);
		int result = ptaskDao.insertTask(vo);
		System.out.println("result : " +result);
		System.out.println("after 11: " +vo);
		
		if(vo.getFilevo() != null && !vo.getFilevo().equals("")){
			System.out.println("들렸어");
            int savedFileId = fileDao.savedFile(vo); 
        }
		System.out.println("안들렸어");
		return result;
	} 
	
	@Override
    public int updateHide(String tno) {
    	return ptaskDao.updateHide(tno);
    }
	
	@Override
	public PtaskVo selectOneInner(PnoTnoParam pnoTnoParam) {
		return ptaskDao.selectOneInner(pnoTnoParam);
	}
	
	@Override
	public int update(PtaskVo vo) {
		return ptaskDao.update(vo);
	}
	
	@Override
	@Transactional
	public int deleteTask(String tno) {
		fileDao.deleteFile(tno);
		replyDao.deleteReplyAll(tno);
		int result = ptaskDao.deleteTask(tno);
		return result;
	}
	
}
