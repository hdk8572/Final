package kh.groupware.stream.company.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.groupware.stream.company.model.vo.CompanyInsertParam;
import kh.groupware.stream.company.model.vo.DeptVo;



public interface CompanyService {

	// 회사회원가입 1: COMPANY insert
	// 회사회원가입 2: DEPT insert
	// 회사회원가입 3: USERS insert
	// 회사회원가입 4: USERS Company Id insert
	public int newCompany(CompanyInsertParam cvo);
	public int inviteMember(CompanyInsertParam cvo);
	public String selectCcode(String cname);
	
	//회사코드로 부서찾기
	public List<DeptVo> deptList(String ccode);

}
