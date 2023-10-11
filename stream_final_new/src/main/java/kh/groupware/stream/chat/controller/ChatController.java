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
	    public ModelAndView rooms(ModelAndView mv,Principal principal, Model model) throws Exception{        
		  	String userId = principal.getName();
		  	mv.setViewName("chatting/rooms");
			mv.addObject("list", service.findAllRooms(userId));
			model.addAttribute("viewMemmber", service.ViewMember());
	        return mv;
	    }
 @GetMapping("/room")
 public ModelAndView getRoom(String roomId, Model model,ModelAndView mv,Principal principal){
 	String userId = principal.getName();
 	mv.addObject("ID",userId);
 	model.addAttribute("room", service.findRoomById(roomId)); 
 	mv.setViewName("chatting/room");
 	//만약 mName이 null이면 표시하지 않음(추가예정)
     model.addAttribute("viewChat", service.ViewChat(roomId));
     return mv;
 }
	    @PostMapping(value = "/room")
	    public String create(@RequestParam String roomName,Principal principal, RedirectAttributes rttr){
//	    	log.info("# Create Chat Room, roomName: " + roomName + ", userId: " + userId);
	    	String userId = principal.getName();
	    	service.AddChatRoom(roomName, userId);
	        rttr.addFlashAttribute("roomName1", roomName);
	        return "redirect:/rooms";
	    }


}
