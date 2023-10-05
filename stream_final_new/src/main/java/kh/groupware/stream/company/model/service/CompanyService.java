package kh.groupware.stream.company.model.service;

import java.util.List;

import kh.groupware.stream.company.model.vo.CompanyVo;
import kh.groupware.stream.dept.model.vo.DeptVo;

public interface CompanyService {

	//회사회원가입 1: COMPANY insert
	public int newCompany (CompanyVo cvo);
	
	//회사회원가입 2: DEPT insert
	public int newDept (List<DeptVo> deptList);
	
}
