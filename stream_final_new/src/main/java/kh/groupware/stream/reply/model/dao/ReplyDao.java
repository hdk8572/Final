package kh.groupware.stream.reply.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.reply.model.vo.ReplyVo;

@Repository
public class ReplyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ReplyVo> selectList(String tno) {
		return sqlSession.selectList("reply.selectList", tno);
	}

	public ReplyVo selectOne(String rno) {
		return sqlSession.selectOne("reply.selectOne", rno);
	} 
	
	public int insert(ReplyVo vo) {
		return sqlSession.insert("reply.insertReply", vo);
	}
	
	public int update(ReplyVo vo) {
		return sqlSession.update("reply.updateReply", vo);
	}
	
	public int delete(String rno) {
		return sqlSession.delete("reply.deleteReply", rno);
	}
	
}


