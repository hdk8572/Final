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
	private List<ReplyVo> selectList(String tno) {
		List<ReplyVo> vo = replyService.selectList(tno);
		return vo; 
	}

	@PostMapping ("/insertReply")
	@ResponseBody
	public void insertReply(ReplyVo vo) {
	    replyService.insertReply(vo);
	}
/*	
	@PostMapping ("/insertReply")
	@ResponseBody
	public int insertReply(@RequestParam("tno") String tno) {
	    return replyService.insertReply(tno);
	}
*/
	
	
}