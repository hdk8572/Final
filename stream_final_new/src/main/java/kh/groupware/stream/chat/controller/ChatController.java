package kh.groupware.stream.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.groupware.stream.chat.model.dao.ChatService;
import kh.groupware.stream.chat.model.vo.ChatVo;


@Controller
public class ChatController {
	@Autowired
	private ChatService service;
	
	/*
	 * @GetMapping("/chat") public ModelAndView selectchat(ModelAndView mv, String
	 * userid) {
	 * 
	 * List<ChatVo> result = service.selectuserList(userid);
	 * mv.addObject("selecuserList", result);
	 * 
	 * mv.setViewName("chatting/select"); return mv; }
	 */
	@GetMapping("/chat")
	public String selectchat(Model model) {
		List<ChatVo> list = service.selectuserList();
		model.addAttribute("list",list);
		return "/chatting/select";
	}
	@GetMapping("/chattestroom")
	public String chatroom2() {
		return "/chatting/selectroom";
	}
	@GetMapping("/exchat")
	public String chatroom3() {
		return "/chatting/exselect";
	}
}
