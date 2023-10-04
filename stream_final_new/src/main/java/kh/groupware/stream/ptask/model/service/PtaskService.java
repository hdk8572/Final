package kh.groupware.stream.ptask.model.service;

import java.util.List;


import kh.groupware.stream.project.model.vo.PnoTnoParam;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

public interface PtaskService {

	public List<PtaskVo> pselectList(String pno);
	public int insertTask(PtaskVo vo);
    public int deleteTask(String pno);
    public PtaskVo selectOneInner(PnoTnoParam pnoTnoParam);
    
}
