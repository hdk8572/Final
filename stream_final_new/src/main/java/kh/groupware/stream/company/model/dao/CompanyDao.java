package kh.groupware.stream.company.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.company.model.vo.CompanyInsertParam;
import kh.groupware.stream.company.model.vo.DeptVo;

@Repository("companyDao")
public class CompanyDao {

	@Autowired
	private SqlSession sqlSession;

	// 회사회원가입 1: COMPANY insert
	public int newCompany(CompanyInsertParam cvo) {
		System.out.println("[jy] before:" + cvo);
		int result = sqlSession.insert("company.newCompany", cvo);
		System.out.println("[jy] after :" + cvo);
		System.out.println("[jy] result :" + result);
		return result;
	}

	// 회사 회원가입 2: DEPT insert
	public int newDept(CompanyInsertParam cvo) {
		return sqlSession.insert("department.newDept", cvo);
	}

	// 회사회원가입 3: USERS insert
	public int newUsers(CompanyInsertParam cvo) {
		return sqlSession.insert("member.newUsers", cvo);
	}

	// 회사회원가입 4: USERS Company Id insert
	public int newCompanyId(CompanyInsertParam cvo) {
		return sqlSession.insert("member.newCompanyId", cvo);
	}

	public String selectCcode(String cname) {
		return sqlSession.selectOne("member.selectCcode", cname);
	}

	// 회사코드로 부서찾기
	public List<DeptVo> deptList(String ccode) {
		return sqlSession.selectList("department.deptList", ccode);
	}


}
