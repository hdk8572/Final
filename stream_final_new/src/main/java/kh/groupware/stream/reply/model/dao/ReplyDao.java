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
	
	public int insert(String tno) {
		return sqlSession.insert("reply.insertReply", tno);
	}
}


