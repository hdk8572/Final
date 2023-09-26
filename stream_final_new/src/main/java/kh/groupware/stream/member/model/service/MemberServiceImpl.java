package kh.groupware.stream.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.member.model.dao.MemberDao;
import kh.groupware.stream.member.model.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	//회원가입(update)
	@Override
	public int signUp(MemberVo mvo) {
		return memberDao.signUp(mvo);
	}

}
