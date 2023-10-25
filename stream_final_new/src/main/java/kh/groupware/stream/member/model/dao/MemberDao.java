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
	
	//회원가입(update)
	public int signUp(MemberVo mvo) throws Exception{
		return sqlSession.update("member.signUp", mvo);
	}
	//id존재여부 체크
	public int idCheck(String userid) {
		return sqlSession.selectOne("member.idCheck", userid);
	}
	//회사코드 체크
	public int ccodeCheck(MemberVo mvo) {
		return sqlSession.selectOne("member.ccodeCheck", mvo);
	}
	//마이페이지
	public MyPageVo showMyPage(String userid) {
		return sqlSession.selectOne("member.showMyPage", userid);
	}
	//마이페이지 수정1(pwd포함)
	public int editMyPage(MemberVo mvo) {
		return sqlSession.update("member.editMyPage", mvo);
	}
	//마이페이지 수정2(pwd미포함)
	public int editMyPage2(MemberVo mvo) {
		return sqlSession.update("member.editMyPage2", mvo);
	}
	//마이페이지 수정화면
	public MyPageVo showEditMyPage(String userid) {
		return sqlSession.selectOne("member.showEditMyPage",userid);
	}
	
	
}
