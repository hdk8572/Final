package kh.groupware.stream.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.groupware.stream.reply.model.service.ReplyService;
import kh.groupware.stream.reply.model.vo.ReplyVo;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@GetMapping ("/replyList")
	@ResponseBody
	public List<ReplyVo> selectList(String tno) {
		List<ReplyVo> vo = replyService.selectList(tno);
		return vo; 
	}

	@PostMapping ("/insertReply")
	@ResponseBody
	public List<ReplyVo> insertReply(ReplyVo vo) {
		return replyService.insertReply(vo);
	}
	
	@PostMapping ("/goUpdateReply")
	@ResponseBody
	public ReplyVo selectOne(String rno) {
		return replyService.selectOne(rno);
	}
	
	@PostMapping ("/doDeleteReply")
	@ResponseBody
	public int deleteReply(String rno) {
		return replyService.deleteReply(rno);
	}
}