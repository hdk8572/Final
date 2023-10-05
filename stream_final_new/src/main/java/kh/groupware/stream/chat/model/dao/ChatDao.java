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
	
	
	public int AddChatRoom(String roomName,String userId) {
		ChatRoomVo room = ChatRoomVo.create(roomName, userId);
		return sqlSession.insert("chat.chatInsert",room);
	}
	
	public List<ChatRoomVo> findAllRooms(String userId){
		return sqlSession.selectList("chat.findAllRooms",userId);
	}
	public int MessageInsert(ChatMessageVo vo) {
		return sqlSession.insert("chat.messageInsert",vo);
	}
	public List<ChatMessageVo> ViewChat(String id){
		return sqlSession.selectList("chat.viewChat",id);
	}
	 public ChatRoomVo findRoomById(String id) {
	        return sqlSession.selectOne("chat.findRoomById", id);
	    }
}
