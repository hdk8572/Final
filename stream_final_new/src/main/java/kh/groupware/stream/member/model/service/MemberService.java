package kh.groupware.stream.member.model.service;

import kh.groupware.stream.member.model.vo.MemberVo;
import kh.groupware.stream.member.model.vo.MyPageVo;

public interface MemberService {

	int signUp(MemberVo mvo);
	int idCheck(String userid);
	public MyPageVo showMyPage(String userid);
	
	

}
