package kh.groupware.stream.company.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.company.model.vo.CompanyInsertParam;

@Repository("companyDao")
public class CompanyDao {

	@Autowired
	private SqlSession sqlSession;

	// 회사회원가입 1: COMPANY insert
	public int newCompany(CompanyInsertParam cvo) {
		System.out.println("before:" + cvo);
		int result = sqlSession.insert("company.newCompany", cvo);
		System.out.println("after :" + cvo);
		System.out.println("result :" + result);
		return result;
	}

	// 회사 회원가입 2: DEPT insert
	public int newDept(CompanyInsertParam cvo) {
		return sqlSession.insert("department.newDept", cvo);
	}

	/*
	 * // 로그인시 부서조회 public String selectOne(CompanyVo cvo) { return
	 * sqlSession.selectOne("company.selectOne", cvo); }
	 * //회사회원가입 1: COMPANY insert public int newCompany(CompanyVo cvo) { return
	 * sqlSession.insert("company.newCompany", cvo); } 
	 */

}
