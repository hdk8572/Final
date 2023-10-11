package kh.groupware.stream.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.member.model.dao.MemberDao;
import kh.groupware.stream.member.model.vo.MemberVo;
import kh.groupware.stream.member.model.vo.MyPageVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	//회원가입(update)
	@Override
	public int signUp(MemberVo mvo) throws Exception{
		return memberDao.signUp(mvo);
	}
	
	//id존재여부 체크
	@Override
	public int idCheck(String userid) {
		return memberDao.idCheck(userid);
	}
	//회사코드 체크
	@Override
	public int ccodeCheck(MemberVo mvo) {
		return memberDao.ccodeCheck(mvo);
	}
	
	// 마이페이지
	@Override
	public MyPageVo showMyPage(String userid) {
		return memberDao.showMyPage(userid); 
		
	}
	@Override
	public MyPageVo showEditMyPage(String userid) {
		return memberDao.showEditMyPage(userid);
	}
	// 마이페이지 정보수정
	@Override
	public int editMyPage(MemberVo mvo) {
		return memberDao.editMyPage(mvo);
	}


}
