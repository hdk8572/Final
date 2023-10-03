package kh.groupware.stream.chat.controller;



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
		return "/chatting/chattest";
		
	}
//	 @GetMapping("/chat")
//	    public String chatGET(){
//
//	        System.out.println("@ChatController, chat GET()");
//	        
//	        return "chat";
//	    }
//	 @GetMapping("/chat1")
//	    public String chatGETTest(){
//		 System.out.println("@ChatController, chat GET()");
//	        
//	        return "chat1";
//	    }	 
//	  @GetMapping(value = "/rooms")
//	    public ModelAndView rooms(ModelAndView mv) throws Exception{        
//		  log.info("# All Chat Rooms");
//	        mv.addObject("list", service.findAllRooms());
//	        mv.setViewName("chatting/rooms");
//	        return mv;
//	    }
//	    @PostMapping(value = "/room")
//	    public String create(@RequestParam String roomName,@RequestParam String writer, RedirectAttributes rttr){
//	    	log.info("# Create Chat Room, roomName: " + roomName + ", writer: " + writer);
//	    	service.AddChatRoom(roomName, writer);
//	        rttr.addFlashAttribute("roomName1", roomName);
//	        return "redirect:/rooms";
//	    }
//	    @GetMapping("/room")
//	    public ModelAndView getRoom(String roomId, Model model,ModelAndView mv){
//	    	 log.info("# get Chat Room, roomID : " + roomId);
//	        model.addAttribute("room", service.findRoomById(roomId));
//	        mv.setViewName("chatting/room");
//	        model.addAttribute("viewChat", service.ViewChat(roomId));
//	        return mv;
//	    }
}
