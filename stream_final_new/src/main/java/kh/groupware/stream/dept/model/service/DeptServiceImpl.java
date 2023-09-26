package kh.groupware.stream.dept.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.dept.model.dao.DeptDao;
import kh.groupware.stream.dept.model.vo.DeptVo;

@Service
public class DeptServiceImpl implements DeptService {
	
	@Autowired
	private DeptDao deptdao;
	
	//회사코드로 부서찾기
	public List<DeptVo> deptList(String ccode){
		return deptdao.deptList(ccode);
	}
}
