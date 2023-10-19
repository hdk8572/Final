package kh.groupware.stream.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.admin.model.vo.AdminVo;
import kh.groupware.stream.admin.model.vo.PagingVo;
import kh.groupware.stream.company.model.vo.CompanyVo;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public AdminVo cnt(){
		return sqlSession.selectOne("admin.cnt");
	}
	public List<CompanyVo> companyList(){
		return sqlSession.selectList("admin.clist");
	}
	public int countCompany() {
		return sqlSession.selectOne("admin.countCompany");
	}
	public List<CompanyVo> pagingCompanyList(PagingVo vo){
		return sqlSession.selectList("admin.clistPaging");
	}
	
	
}
