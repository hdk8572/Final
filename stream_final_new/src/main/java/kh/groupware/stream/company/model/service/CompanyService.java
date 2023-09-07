package kh.groupware.stream.company.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import kh.groupware.stream.company.model.dao.CompanyDao;
import kh.groupware.stream.company.model.vo.CompanyVo;

public class CompanyService {
	@Autowired
	private CompanyDao companyDao;

	// login
	public String selectOne(CompanyVo cvo) {
		return companyDao.selectOne(cvo);
	}
}
