package kh.groupware.stream.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.member.model.vo.MemberVo;


@Repository("memberDao")
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	public String selectOne(MemberVo mvo) {
		return sqlSession.selectOne("member.selectOne", mvo);
	}
	public int signUp(MemberVo mvo) {
		return sqlSession.insert("member.insert", mvo);
	
	}
}
