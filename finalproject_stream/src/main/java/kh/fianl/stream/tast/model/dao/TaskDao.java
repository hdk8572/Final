package kh.fianl.stream.tast.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kh.fianl.stream.tast.model.vo.TaskVo;

@Repository("taskdao")
public class TaskDao {

	public List<TaskVo> selectList(){
		List<TaskVo> result = null;
		
		return result;
	}
}
