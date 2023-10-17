package kh.groupware.stream.company.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.groupware.stream.company.model.dao.CompanyDao;
import kh.groupware.stream.company.model.vo.CompanyInsertParam;
import kh.groupware.stream.company.model.vo.DeptVo;
import kh.groupware.stream.member.model.dao.MemberDao;



@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private MemberDao memberDao;

	//회사회원가입 1: COMPANY insert
	//회사회원가입 2: DEPT insert
	//회사회원가입 3: USERS insert
	//회사회원가입 4: USERS Company Id insert
	@Override
	@Transactional
	public int newCompany (CompanyInsertParam cvo) {
		int result = 0;
		result = companyDao.newCompany(cvo);
		result = companyDao.newDept(cvo);
		result = companyDao.newUsers(cvo);
		result = companyDao.newCompanyId(cvo);
		return result;
	}

	@Override
	public int inviteMember(CompanyInsertParam cvo) {
		int result = companyDao.newUsers(cvo);
		return result;
	}

	@Override
	public String selectCcode(String cname) {
		String result = companyDao.selectCcode(cname);
		return result;
	}
	
	//회사코드로 부서찾기
	public List<DeptVo> deptList(String ccode){
		return companyDao.deptList(ccode);
	}

	
	
	
	
	/*
	 * //회사회원가입 2: DEPT insert
	 * 
	 * @Override public int newDept (CompanyInsertParam cvo) { return
	 * companyDao.newDept(cvo); }
	 */
	//회사회원가입 3: USERS insert
//	@Override
//	public int newUsers (CompanyInsertParam cvo) {
//		int result = 0;
//		result = companyDao.newUsers(cvo);
//		return result;
//	}
//	//회사회원가입 4: USERS Company Id insert
//	@Override
//	public int newCompanyId (CompanyInsertParam cvo) {
//		int result = 0;
//		result = companyDao.newCompanyId(cvo);
//		return result;
//	}
}
