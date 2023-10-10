package kh.groupware.stream.chat.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.groupware.stream.chat.model.service.ChatService;
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
		return "/chatting/select";

	}

	@GetMapping("/chat")
	public String chatGET() {

		System.out.println("@ChatController, chat GET()");

		return "chat";
	}

	@GetMapping("/chat1")
	public String chatGETTest() {
		System.out.println("@ChatController, chat GET()");

		return "chat1";
	}

//	@GetMapping(value = "/rooms")
//	public ModelAndView rooms(ModelAndView mv, Principal principal, Model model) throws Exception {
//		String userId = principal.getName();
//		mv.setViewName("chatting/rooms");
//		mv.addObject("list", service.findAllRooms(userId));
//		model.addAttribute("viewMemmber", service.ViewMember());
//		return mv;
//	}

	@GetMapping(value = "/rooms")
	public ModelAndView rooms(ModelAndView mv) throws Exception {
		mv.setViewName("chatting/rooms");
		mv.addObject("list", service.findAllRooms());
		mv.addObject("viewMemmber", service.ViewMember());
		return mv;
	}

	@GetMapping("/room")
	public ModelAndView getRoom(String roomId, Principal principal, ModelAndView mv,Model model) throws Exception {
		String userId = principal.getName();
		mv.setViewName("chatting/room");
		mv.addObject("Id", userId);
		mv.addObject("room", service.readRoom(roomId));
		model.addAttribute("viewChat", service.ViewChat(roomId));
		return mv;
	}

	@PostMapping(value = "/room")
	public String create(@RequestParam String roomName, @RequestParam String userId, RedirectAttributes rttr)  throws Exception {
//	    	log.info("# Create Chat Room, roomName: " + roomName + ", userId: " + userId);	    	
		service.memberInsert(userId);
		service.AddChatRoom(roomName);
		rttr.addFlashAttribute("roomName1", roomName);
		rttr.addFlashAttribute("member", userId);
		return "redirect:/rooms";
	}

}
