package kh.groupware.stream.chat.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.chat.model.vo.ChatVo;
@Service
public class ChatServlceImpl implements ChatService{
	
	@Autowired
	private ChatDao dao;
	
	@Override
	public List<ChatVo> selectuserList(){
		return dao.selectuserList();
	}
	

}
