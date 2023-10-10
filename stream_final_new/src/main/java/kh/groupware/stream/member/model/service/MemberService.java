package kh.groupware.stream.member.model.service;

import kh.groupware.stream.member.model.vo.MemberVo;
import kh.groupware.stream.member.model.vo.MyPageVo;

public interface MemberService {

	int signUp(MemberVo mvo);
	int idCheck(String userid);
	MyPageVo showMyPage(String userid);
	MyPageVo showEditMyPage(String userid);
	int editMyPage(MemberVo mvo);
	int editMyPage2(MemberVo mvo);
	

}
