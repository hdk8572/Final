package kh.groupware.stream.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.chat.model.vo.ChatMessageVo;
import kh.groupware.stream.chat.model.vo.ChatRoomVo;

@Repository
public class ChatDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	public int AddChatRoom(String roomName,String userId) {
		ChatRoomVo room = ChatRoomVo.create(roomName, userId);
		return sqlSession.insert("chat.chatInsert",room);
	}
	
	public List<ChatRoomVo> FindAllRooms(String userId){
		return sqlSession.selectList("chat.findAllRooms",userId);
	}
	public List<ChatRoomVo> FindRooms(String userId){
		return sqlSession.selectList("chat.findRooms",userId);
	}
	public int MessageInsert(ChatMessageVo vo) {
		return sqlSession.insert("chat.messageInsert",vo);
	}
	public int MemberInsert(String userId) {
		return sqlSession.insert("chat.memberInsert",userId);
	}
	public List<ChatMessageVo> ViewChat(String id){
		return sqlSession.selectList("chat.viewChat",id);
	}
	 public ChatRoomVo FindRoomById(String roomId) {
	        return sqlSession.selectOne("chat.findRoomById", roomId);
	  }
	public List<ChatRoomVo> ViewMember(String userId){
			return sqlSession.selectList("chat.viewMember",userId);
	}
	public ChatRoomVo FindWriter(String userId){
		return sqlSession.selectOne("chat.findWriter",userId);
	}
	public List<ChatRoomVo> FindName() {
		return sqlSession.selectList("chat.findname");
	}
	public int ChatDelete(ChatRoomVo vo) {
		return sqlSession.delete("chat.chatDelete",vo);
	}
}
