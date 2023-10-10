package kh.groupware.stream.reply.model.service;

import java.util.List;

import kh.groupware.stream.reply.model.vo.ReplyVo;

public interface ReplyService {

	public List<ReplyVo> selectList(String tno);
	public ReplyVo selectOne(String rno);
	public List<ReplyVo> insertReply(ReplyVo vo);
	public int updateReply(ReplyVo vo);
	public int deleteReply(String rno);
	
}