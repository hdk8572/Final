package kh.groupware.stream.ptask.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.ptask.model.PtaskDao;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

public interface PtaskService {

	public List<PtaskVo> selectList();
	public List<PtaskVo> pselectList(String pno);
	public int insertTask(PtaskVo vo);
    public int deleteTask(String pno);
}
