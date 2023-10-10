package kh.groupware.stream.reply.model.service;

import java.util.List;

import kh.groupware.stream.reply.model.vo.ReplyVo;

public interface ReplyService {

	public List<ReplyVo> selectList(String tno);
	public List<ReplyVo> insertReply(ReplyVo vo);
	
}