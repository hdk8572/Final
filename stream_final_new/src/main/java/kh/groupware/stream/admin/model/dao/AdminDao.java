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
	
	/* 간단한 통계*/
	public AdminVo cnt() throws Exception{
		return sqlSession.selectOne("admin.cnt");
	}

	/* 회사 목록 조회 */
	public List<CompanyVo> companyList() throws Exception{
		return sqlSession.selectList("admin.clist");
	}

	/* 페이징 처리 위한 전체 목록 확인 */
	public int countCompany() throws Exception{
		return sqlSession.selectOne("admin.countCompany");
	}

	/* 페이징 처리 후 회사 목록 조회 */
	public List<CompanyVo> pagingCompanyList(PagingVo vo) throws Exception{
		return sqlSession.selectList("admin.clistPaging", vo);
	}

	/* 회사 상세 조회 */
	public List<AdminVo> showCompanyDetail(String ccode) throws Exception{
		return sqlSession.selectList("admin.showCompanyDetail", ccode);
	}

	/* 차트 그리기 */
	public List<AdminVo> makePieChart(String ccode) throws Exception{
		return sqlSession.selectList("admin.makePieChart", ccode);
	}
	
}
