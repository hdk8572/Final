package kh.groupware.stream.member.model.service;

import kh.groupware.stream.member.model.vo.MemberVo;
import kh.groupware.stream.member.model.vo.MyPageVo;

public interface MemberService {

	int signUp(MemberVo mvo) throws Exception;
	int idCheck(String userid);
	int ccodeCheck(MemberVo mvo);
	MyPageVo showMyPage(String userid);
	MyPageVo showEditMyPage(String userid);
	int editMyPage(MemberVo mvo);
	
	

}
