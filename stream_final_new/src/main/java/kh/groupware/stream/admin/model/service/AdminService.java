package kh.groupware.stream.admin.model.service;


import java.util.List;


import kh.groupware.stream.admin.model.vo.AdminVo;
import kh.groupware.stream.admin.model.vo.PagingVo;
import kh.groupware.stream.company.model.vo.CompanyVo;

public interface AdminService {
	
	public AdminVo cnt();
	public List<CompanyVo> companyList();
	
	public int countCompany(); 
	public List<CompanyVo> pagingCompanyList(PagingVo vo);

}
