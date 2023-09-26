package kh.groupware.stream.chat.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import kh.groupware.stream.chat.model.dao.ChatService;
import kh.groupware.stream.chat.model.vo.ChatVo;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	@Autowired
	private ChatService service;

	@GetMapping("/chatlist")
	public String selectchat(Model model) {
		List<ChatVo> list = service.selectuserList();
		model.addAttribute("list", list);
		System.out.println(list);
		return "/chatting/select";
		
	}
	 @GetMapping("/chat")
	    public String chatGET(){

	        System.out.println("@ChatController, chat GET()");
	        
	        return "chat";
	    }
	 @GetMapping("/chat1")
	    public String chatGETTest(){
		 System.out.println("@ChatController, chat GET()");
	        
	        return "chat1";
	    }

	/*
	 * @GetMapping("/chattestroom") public void chat(Model model) {
	 * 
	 * CustomUser user = (CustomUser)
	 * SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	 * 
	 * model.addAttribute("userid", user.getUsername()); }
	 */
}
