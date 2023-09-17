package kh.groupware.stream.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	@GetMapping("/chat")
	public String chatroom() {
		return "/chat";
	}
	@GetMapping("/chattest")
	public String chatroom1() {
		return "/chatting/select";
	}
	@GetMapping("/chattestroom")
	public String chatroom2() {
		return "/chatting/selectroom";
	}
}
