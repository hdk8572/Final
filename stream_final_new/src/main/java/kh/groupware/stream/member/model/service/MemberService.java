package kh.groupware.stream.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.company.model.dao.MemberDao;
import kh.groupware.stream.member.model.vo.MemberVo;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	//login
	public String selectOne(MemberVo mvo) {
		return memberDao.selectOne(mvo);
	}
	
	

}
