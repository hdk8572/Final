package kh.groupware.stream.company.model.service;

import kh.groupware.stream.company.model.vo.CompanyVo;

public interface CompanyService {

	//회사 회원가입 (5단계중 1)
	public int newCompany (CompanyVo cvo);
	
}
