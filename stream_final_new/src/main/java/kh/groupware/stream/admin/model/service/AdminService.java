package kh.groupware.stream.admin.model.service;


import java.util.List;


import kh.groupware.stream.admin.model.vo.AdminVo;
import kh.groupware.stream.admin.model.vo.PagingVo;
import kh.groupware.stream.company.model.vo.CompanyVo;

public interface AdminService {
	
	/* 간단한 통계*/
	public AdminVo cnt() throws Exception;
	/* 회사 목록 조회 */
	public List<CompanyVo> companyList() throws Exception;
	/* 페이징 처리 위한 전체 목록 확인 */
	public int countCompany() throws Exception; 
	/* 페이징 처리 후 회사 목록 조회 */
	public List<CompanyVo> pagingCompanyList(PagingVo vo) throws Exception;
	/* 회사 상세 조회 */
	public List<AdminVo> showCompanyDetail(String ccode) throws Exception;
	/* 차트 그리기 */
	public List<AdminVo> makePieChart(String ccode) throws Exception;
}
