package kh.groupware.stream.info.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.groupware.stream.info.model.service.InfoService;
import kh.groupware.stream.info.model.vo.InfoPageVo;
import kh.groupware.stream.info.model.vo.InfoVo;

@Controller
public class InfoController {
	@Autowired
	private InfoService service;
	
	
	@GetMapping("/member/info")
	public ModelAndView info(ModelAndView mv, Principal principal,InfoPageVo vo,
	                    
	                        @RequestParam(value="nowPage", required=false)String nowPage, 
	            			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
	            			HttpSession session) {
	    String userId = principal.getName();
	    

	    
	    int total = service.CountInfo();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new InfoPageVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mv.addObject("paging", vo);
		mv.addObject("viewAll", service.PagingInfo(vo));
	    mv.setViewName("info/main");
	    return mv;
	}
	@GetMapping("/member/info/insert")
	public ModelAndView insert(ModelAndView mv,Principal principal) {
		String userId = principal.getName();
		mv.addObject("name",service.InfoWriter(userId));
		mv.setViewName("info/infoinsert");
		return mv;
	}
	@PostMapping(value="/member/info/insert")
	public String insertdo(ModelAndView mv,Principal principal ,@RequestParam String ititle, @RequestParam String iwriter,
			 @RequestParam String itext,RedirectAttributes rttr,InfoVo vo) {
		String userId = principal.getName();
		if (ititle.isEmpty() || itext.isEmpty()) {
	        
	        rttr.addFlashAttribute("error", "제목과 내용을 모두 입력하세요.");
	        return "redirect:/member/info/insert";
	    }
		vo.setUserId(userId);
		service.InfoInsert(vo);
		rttr.addFlashAttribute("ititle", ititle);
		rttr.addFlashAttribute("iwriter", iwriter);
		rttr.addFlashAttribute("itext", itext);
		
		return "redirect:/member/info";
	}
	@GetMapping("/member/info/select")
	public ModelAndView select(ModelAndView mv,Principal principal,String ino) {
		String userId = principal.getName();
		mv.addObject("info",service.InfoOne(ino));
		mv.setViewName("info/infoselect");
		return mv;
	}
	@GetMapping("/member/info/update")
	public ModelAndView update(ModelAndView mv,Principal principal,@RequestParam String ino) {
		String userId = principal.getName();
		mv.addObject("userId",userId);
		mv.addObject("info",service.InfoOne(ino));
		mv.setViewName("info/infoupdate");
		return mv;
	}
	@PostMapping(value="/member/info/update")
	public String updatedo(ModelAndView mv,Principal principal ,@RequestParam String ino,@RequestParam String ititle, 
			 @RequestParam String itext,RedirectAttributes rttr,InfoVo vo) {
		String userId = principal.getName();
		vo.setUserId(userId);
		vo.setItext(itext);
		vo.setItitle(ititle);
		System.out.println(vo+"================");
		service.InfoUpdate(vo);
		
		rttr.addFlashAttribute("message", "정보가 업데이트되었습니다.");
		
		return "redirect:/member/info";
	}
	@PostMapping(value="/member/info/delete")
	public String deletedo(@RequestParam String[] ino,HttpServletRequest request) {
		String[] sizes = request.getParameterValues("ino");
		if(sizes != null) {
			for(String size : sizes) {
				service.InfoDelete(size);			
			}
		}
		
		return "redirect:/member/info";
	}
}
