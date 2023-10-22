package kh.groupware.stream.ptask.model.service;

import java.util.List;


import kh.groupware.stream.project.model.vo.PnoTnoParam;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

public interface PtaskService {

	public List<PtaskVo> pselectList(String pno);
	public int insertTask(PtaskVo vo);
    public int updateHide(String tno);
    public PtaskVo selectOneInner(PnoTnoParam pnoTnoParam);
    public int update(PnoTnoParam pnoTnoParam);
    
}
