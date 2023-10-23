package kh.groupware.stream.reply.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Override
	public ReplyVo selectOne(String rno) {
		return replyDao.selectOne(rno);
	}
	
	@Override
	@Transactional
	public List<ReplyVo> insertReply(ReplyVo vo) {
		int result =  replyDao.insert(vo);
		return replyDao.selectList(vo.getTno());
	}
	
	@Override
	public int updateReply(ReplyVo vo) {
		return replyDao.update(vo);
	}
	
	@Override
	public int deleteReply(String rno) {
		return replyDao.delete(rno);
	}
	
//	@Override
//	public int updateReply(ReplyVo vo) {
//		return replyDao.update(vo);
//	}
	
}