package kh.groupware.stream.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.chat.model.vo.ChatVo;

@Repository
public class ChatDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ChatVo> selectuserList(){
		return sqlSession.selectList("selecuserList");
	}
}
