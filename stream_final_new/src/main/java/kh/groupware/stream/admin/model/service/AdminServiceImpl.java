package kh.groupware.stream.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.admin.model.dao.AdminDao;
import kh.groupware.stream.admin.model.vo.AdminVo;
import kh.groupware.stream.admin.model.vo.PagingVo;
import kh.groupware.stream.company.model.vo.CompanyVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	/* 간단한 통계*/
	public AdminVo cnt(){
		return adminDao.cnt();
	}
	/* 회사 목록 조회 */
	public List<CompanyVo> companyList(){
		return adminDao.companyList();
	}
	/* 페이징 처리 위한 전체 목록 확인 */
	public int countCompany() {
		return adminDao.countCompany();
	}
	/* 페이징 처리 후 회사 목록 조회 */
	public List<CompanyVo> pagingCompanyList(PagingVo vo){
		return adminDao.pagingCompanyList(vo);
	}
	/* 회사 상세 조회 */
	public List<AdminVo> showCompanyDetail(String ccode){
		return adminDao.showCompanyDetail(ccode);
	}
	/* 차트 그리기 */
	public List<AdminVo> makePieChart(String ccode){
		return adminDao.makePieChart(ccode);
	}
}
