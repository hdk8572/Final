package kh.groupware.stream.company.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.member.model.vo.MemberVo;

@Repository("memberDao")
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	//login
	public String selectOne(MemberVo mvo) {
		return sqlSession.selectOne("member.selectOne", mvo);
	}
}
