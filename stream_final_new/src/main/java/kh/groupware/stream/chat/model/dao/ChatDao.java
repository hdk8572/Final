package kh.groupware.stream.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.chat.model.vo.ChatMessageVo;
import kh.groupware.stream.chat.model.vo.ChatRoomVo;
import kh.groupware.stream.chat.model.vo.ChatVo;

@Repository
public class ChatDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*
	 * public List<ChatVo> selectuserList(){ return
	 * sqlSession.selectList("selecuserList"); } public String selectuserOne(){
	 * return sqlSession.selectOne("selecuserOne"); }
	 */
	
	
	public int AddChatRoom(String roomName) {
		ChatRoomVo room = ChatRoomVo.create(roomName);
		return sqlSession.insert("chat.chatInsert",room);
	}
	
	public List<ChatRoomVo> findAllRooms(){
		return sqlSession.selectList("chat.findAllRooms");
	}
	public int MessageInsert(ChatMessageVo vo) {
		return sqlSession.insert("chat.messageInsert",vo);
	}
	public List<ChatMessageVo> ViewChat(String roomId){
		return sqlSession.selectList("chat.viewChat",roomId);
	}
	 public ChatRoomVo findRoomById(String userId) {
	        return sqlSession.selectOne("chat.findRoomById",userId);
	  }
	public List<ChatRoomVo> ViewMember(){
			return sqlSession.selectList("chat.viewMember");
	}
	public int memberInsert(String userId) {
		return sqlSession.insert("chat.memberInsert",userId);
	}
	public ChatRoomVo readRoom(String roomId) {
		return sqlSession.selectOne("chat.readRoom",roomId);
	}
}
