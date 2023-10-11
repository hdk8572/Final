package kh.groupware.stream.company.model.service;

import java.util.List;

import kh.groupware.stream.company.model.vo.CompanyInsertParam;



public interface CompanyService {

	//회사회원가입 1: COMPANY insert
	//회사회원가입 2: DEPT insert
	//회사회원가입 3: USERS insert
	//회사회원가입 4: USERS Company Id insert
	public int newCompany(CompanyInsertParam cvo);
	public int inviteMember(CompanyInsertParam cvo);
	public String selectCcode(String cname);

//	public int newDept (CompanyInsertParam cvo);
//	public int newUsers (CompanyInsertParam cvo);
//	public int newCompanyId (CompanyInsertParam cvo);
	
}
