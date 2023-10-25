package kh.groupware.stream.chat.controller;

import java.lang.ProcessBuilder.Redirect;
import java.net.http.HttpRequest;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.groupware.stream.chat.model.service.ChatService;
import kh.groupware.stream.chat.model.vo.ChatRoomVo;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	@Autowired
	private ChatService service;

	

	@GetMapping(value = "/member/rooms")
	public ModelAndView rooms(ModelAndView mv, Principal principal) throws Exception {
		String userId = principal.getName();
			
		mv.setViewName("chatting/rooms");
		mv.addObject("list", service.findAllRooms(userId));
		mv.addObject("viewMemmber", service.ViewMember(userId));
		System.out.println(service.findAllRooms(userId)+"========");
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
		
		return mv;
	}

	@PostMapping(value = "/member/room")
	public String create(@RequestParam String roomName, @RequestParam String[] member, Principal principal,
			RedirectAttributes rttr,HttpServletRequest request,ChatRoomVo vo) {
//	    	log.info("# Create Chat Room, roomName: " + roomName + ", userId: " + userId);
		String userId = principal.getName();
		String[] sizes = request.getParameterValues("member");
		System.out.println(sizes.length);
		service.AddChatRoom(roomName, userId);
		if(sizes != null) {
			for(String size : sizes) {
				service.memberInsert(size); 			
			}
		}
		rttr.addFlashAttribute("roomName1", roomName);
		rttr.addFlashAttribute("member", sizes);
		return "redirect:/member/rooms?size=" + sizes.length;
	}

}
