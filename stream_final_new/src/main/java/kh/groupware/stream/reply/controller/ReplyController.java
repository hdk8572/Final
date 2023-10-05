package kh.groupware.stream.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.groupware.stream.reply.model.service.ReplyService;
import kh.groupware.stream.reply.model.vo.ReplyVo;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@GetMapping ("/replylista")
	@ResponseBody
	private List<ReplyVo> selectList(String tno) {
		List<ReplyVo> vo = replyService.selectList(tno);
		return vo; 
	}
		
	
}
