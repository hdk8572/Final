package kh.groupware.stream.company.model.service;

import java.util.List;

import kh.groupware.stream.company.model.vo.CompanyInsertParam;



public interface CompanyService {

	//회사회원가입 1: COMPANY insert
	public int newCompany(CompanyInsertParam cvo);
	//회사회원가입 2: DEPT insert
	public int newDept (CompanyInsertParam cvo);
	
	
}
