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
	
	public AdminVo cnt(){
		return adminDao.cnt();
	}
	public List<CompanyVo> companyList(){
		return adminDao.companyList();
	}
	public int countCompany() {
		return adminDao.countCompany();
	}
	public List<CompanyVo> pagingCompanyList(PagingVo vo){
		return adminDao.pagingCompanyList(vo);
	}
	public List<AdminVo> showCompanyDetail(String ccode){
		return adminDao.showCompanyDetail(ccode);
	}
	public List<AdminVo> makePieChart(String ccode){
		return adminDao.makePieChart(ccode);
	}
}
