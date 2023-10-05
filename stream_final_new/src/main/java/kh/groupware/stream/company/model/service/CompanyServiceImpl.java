package kh.groupware.stream.company.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.company.model.dao.CompanyDao;
import kh.groupware.stream.company.model.vo.CompanyVo;
import kh.groupware.stream.dept.model.vo.DeptVo;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDao companyDao;

	//회사회원가입 1: COMPANY insert
	@Override
	public int newCompany (CompanyVo cvo) {
		return companyDao.newCompany(cvo);
		
	}
	//회사회원가입 2: DEPT insert
	@Override
	public int newDept (List<DeptVo> deptList) {
		return companyDao.newDept(deptList);
	}
}
