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
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	@Autowired
	private ChatService service;

	
	  @GetMapping("/chatlist") public String selectchat(Model model) { return
	  "/chatting/chattest";
	  
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

	@GetMapping(value = "/member/rooms")
	public ModelAndView rooms(ModelAndView mv, Principal principal) throws Exception {
		String userId = principal.getName();
		mv.setViewName("chatting/rooms");
		mv.addObject("list", service.findAllRooms(userId));
		mv.addObject("viewMemmber", service.ViewMember());
		return mv;
	}

	@GetMapping("/member/room")
	public ModelAndView getRoom(String roomId, ModelAndView mv, Principal principal) {
		String userId = principal.getName();
		mv.addObject("ID", userId);
		mv.addObject("room", service.findRoomById(roomId));
		mv.addObject("viewChat", service.ViewChat(roomId));
		mv.addObject("name", service.findWriter(userId));
		mv.setViewName("chatting/room");
		System.out.println(service.findWriter(userId)+"확인");
		
		return mv;
	}

	@PostMapping(value = "/member/room")
	public String create(@RequestParam String roomName, @RequestParam String member, Principal principal,
			RedirectAttributes rttr) {
//	    	log.info("# Create Chat Room, roomName: " + roomName + ", userId: " + userId);
		String userId = principal.getName();
		service.AddChatRoom(roomName, userId);
		service.memberInsert(member);
		rttr.addFlashAttribute("roomName1", roomName);
		rttr.addFlashAttribute("member", member);
		return "redirect:/member/rooms";
	}

}
