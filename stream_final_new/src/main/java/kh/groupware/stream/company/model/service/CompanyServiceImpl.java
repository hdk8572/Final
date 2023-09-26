package kh.groupware.stream.company.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.company.model.dao.CompanyDao;
import kh.groupware.stream.company.model.vo.CompanyVo;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDao companydao;


}
