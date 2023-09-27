package kh.groupware.stream.member.model.service;

import kh.groupware.stream.member.model.vo.MemberVo;

public interface MemberService {

	int signUp(MemberVo mvo);
	int idCheck(String userid);
	
	

}
