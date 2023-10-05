package kh.groupware.stream.reply.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.reply.model.dao.ReplyDao;
import kh.groupware.stream.reply.model.vo.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public List<ReplyVo> selectList(String tno) {
		return replyDao.selectList(tno);
	}
	
	
}
