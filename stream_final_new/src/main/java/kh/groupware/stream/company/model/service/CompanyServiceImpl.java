package kh.groupware.stream.company.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.groupware.stream.company.model.dao.CompanyDao;
import kh.groupware.stream.company.model.vo.CompanyInsertParam;
import kh.groupware.stream.member.model.dao.MemberDao;



@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private MemberDao memberDao;

	//회사회원가입 1: COMPANY insert
	@Override
	@Transactional
	public int newCompany (CompanyInsertParam cvo) {
		int result = 0;
		result = companyDao.newCompany(cvo);
		result = companyDao.newDept(cvo);
		return result;
	}
	//회사회원가입 2: DEPT insert
	@Override
	public int newDept (CompanyInsertParam cvo) {
		return companyDao.newDept(cvo);
	}
}
