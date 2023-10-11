package kh.groupware.stream.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.groupware.stream.member.model.vo.MemberVo;
import kh.groupware.stream.member.model.vo.MyPageVo;


@Repository("memberDao")
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	public String selectOne(MemberVo mvo) {
		return sqlSession.selectOne("member.selectOne", mvo);
	}
	public int signUp(MemberVo mvo) throws Exception{
		return sqlSession.update("member.signUp", mvo);
	}
	public int idCheck(String userid) {
		return sqlSession.selectOne("member.idCheck", userid);
	}
	public int ccodeCheck(MemberVo mvo) {
		return sqlSession.selectOne("member.ccodeCheck", mvo);
	}
	public MyPageVo showMyPage(String userid) {
		return sqlSession.selectOne("member.showMyPage", userid);
	}
	public int editMyPage(MemberVo mvo) {
		return sqlSession.update("member.editMyPage", mvo);
	}
	public int editMyPage2(MemberVo mvo) {
		return sqlSession.update("member.editMyPage2", mvo);
	}
	public MyPageVo showEditMyPage(String userid) {
		return sqlSession.selectOne("member.showEditMyPage",userid);
	}
	
	
}
