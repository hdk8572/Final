//package kh.groupware.stream.chat.room;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.stream.Collectors;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//public class RoomMainController {
//	@Autowired
//	private RoomService service;
//	
//	
//	List<RoomVo> roomList = new ArrayList<RoomVo>();
//	static int roomId = 0;
//	
//	
//	@RequestMapping("/room")
//	public ModelAndView room(ModelAndView mv)throws Exception {
//		mv.addObject("list", service.findAllRooms());
//		mv.setViewName("room");
//		return mv;
//	}
//	
//	@RequestMapping("/chat")
//	public ModelAndView chat() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/chat");
//		return mv;
//	}
//
//	
//	/**
//	 * 방 생성하기
//	 * @param params
//	 * @return
//	 */
//	@PostMapping("/createRoom")
//	public @ResponseBody List<RoomVo> createRoom(@RequestParam HashMap<Object, Object> params){
//		String roomName = (String) params.get("roomName");
//		if(roomName != null && !roomName.trim().equals("")) {
//			RoomVo room = new RoomVo();
//			room.setRoomId(++roomId);
//			room.setRoomName(roomName);
//			roomList.add(room);
//		}
//		return roomList;
//	}
//	
//	/**
//	 * 방 정보가져오기
//	 * @param params
//	 * @return
//	 */
//	@RequestMapping("/getRoom")
//	public @ResponseBody List<RoomVo> getRoom(@RequestParam HashMap<Object, Object> params){
//		return roomList;
//	}
//	
//	/**
//	 * 채팅방
//	 * @return
//	 */
//	@RequestMapping("/moveChatting")
//	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
//		ModelAndView mv = new ModelAndView();
//		int roomId = Integer.parseInt((String) params.get("roomId"));
//		
//		List<RoomVo> new_list = roomList.stream().filter(o->o.getRoomId()==roomId).collect(Collectors.toList());
//		if(new_list != null && new_list.size() > 0) {
//			mv.addObject("roomName", params.get("roomName"));
//			mv.addObject("roomId", params.get("roomId"));
//			mv.setViewName("chat");
//		}else {
//			mv.setViewName("room");
//		}
//		return mv;
//	}
//}
