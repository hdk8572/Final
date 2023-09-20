package kh.groupware.stream.dept.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import kh.groupware.stream.dept.model.vo.DeptVo;

@Service
public interface DeptService {
	public List<DeptVo> deptList(String ccode);
}
