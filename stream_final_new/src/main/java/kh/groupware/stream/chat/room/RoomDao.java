package kh.groupware.stream.chat.room;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.chat.model.vo.ChatMessageVo;
import kh.groupware.stream.chat.model.vo.ChatRoomVo;

@Repository
public class RoomDao {
	@Autowired
	private SqlSession sqlSession;
	public int AddChatRoom(String roomName,String userId) {
		RoomVo room = RoomVo.create(roomName, userId);
		return sqlSession.insert("chat.chatInsert",room);
	}
	public List<RoomVo> findAllRooms(){
		return sqlSession.selectList("chat.findAllRooms");
	}
}
	
	
//	public int AddChatRoom(String roomName,String writer) {
//		ChatRoomVo room = ChatRoomVo.create(roomName, writer);
//		return sqlSession.insert("chat.chatInsert",room);
//	}
//	

//	public int MessageInsert(ChatMessageVo vo) {
//		return sqlSession.insert("chat.messageInsert",vo);
//	}
//	public List<ChatMessageVo> ViewChat(String id){
//		return sqlSession.selectList("chat.viewChat",id);
//	}
//	 public ChatRoomVo findRoomById(String id) {
//	        return sqlSession.selectOne("chat.findRoomById", id);
//	    }
//}
