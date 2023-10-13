package kh.groupware.stream.ptask.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.cloudinary.utils.StringUtils;

import kh.groupware.stream.files.model.service.FileService;
import kh.groupware.stream.files.model.vo.FileVo;
import kh.groupware.stream.project.model.service.ProjectService;
import kh.groupware.stream.project.model.vo.PnoTnoParam;
import kh.groupware.stream.project.model.vo.ProjectVo;
import kh.groupware.stream.ptask.model.service.PtaskService;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Controller
public class PtaskController {

	@Autowired
	private PtaskService ptaskService;

	@Autowired
	private ProjectService projectService;

	@GetMapping("/ptasklist")
	public String ptasklist(Model model, String pno) {
		List<PtaskVo> tlist = ptaskService.pselectList(pno);
		ProjectVo pname = projectService.sessionPname(pno);
		model.addAttribute("pno", pno);
		model.addAttribute("tlist", tlist);
		model.addAttribute("projectPname", pname);
		
		return "project";
	}
	
//	/* upload 시도 */
//	@PostMapping("/insertPtask")
//	@Transactional
//	public String insertTask(Model model, PtaskVo vo, MultipartFile upload) {
//		// file server save ==> return savedpath 
//		fileService.savedFile(upload);
//		ptaskService.insertTask(vo);
//		return "redirect:ptasklist?pno="+vo.getPno();
//	}

	@PostMapping("/insertPtask")
	public String insertTask(Model model, PtaskVo vo, FileVo fvo, MultipartFile upload, HttpServletRequest request) {
	    // file server save ==> return savedpath

	    Map config = new HashMap();
	    config.put("cloud_name", "dup9irkxd");
	    config.put("api_key", "371128821948137");
	    config.put("api_secret", "utt72ECxh7rpq4CPsbg01B5XyiM");

	    Cloudinary cloudinary = new Cloudinary(config);

//	    Map<String, String> result = new HashMap<String, String>();
	    
	    MultipartFile file = upload;
	    Map res = null;
	    
	    if(file != null && file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
	        try {
	            // 파일 이름 설정
	            String fileName = file.getOriginalFilename();
	            System.out.println("원래 파일 이름 :"+fileName);

	            File uploadedFile = new File(fileName);
	            file.transferTo(uploadedFile);
	            
	            res = cloudinary.uploader().upload(uploadedFile, ObjectUtils.emptyMap());
	            System.out.println("============= [[ cloudinary res ==============");
	            System.out.println(res);
	            System.out.println("============= cloudinary res ]] ==============");
	            
	            if(res != null) {
		            String cloudinaryUrl = res.get("url") == null ? "" : res.get("url").toString();
		            
		            System.out.println("cloudinaryUrl: " + cloudinaryUrl);
		            
		            fvo.setForiginname(fileName);  // orginal file name
		            fvo.setFpath(cloudinaryUrl);
		            String savedfilename = cloudinaryUrl.substring(cloudinaryUrl.lastIndexOf('/')+1);
		            System.out.println("savedfilename: "+savedfilename);
		            fvo.setFname(savedfilename);
		            fvo.setFsize(file.getSize());
		            System.out.println("fvo :"+fvo);
		            vo.setFilevo(fvo);
	            }
	        } catch (IOException e) {
	           e.printStackTrace(); // or log error message using a logging framework
	           return "redirect:ptasklist?pno="+vo.getPno(); // redirect to error page or similar.
	        }
	    } 
	    
	    System.out.println("taskId 가나요?");
        int taskId = ptaskService.insertTask(vo); 
        System.out.println("taskId :" + taskId);
        return "redirect:ptasklist?pno="+vo.getPno();

	}
	
	@GetMapping("/ptaskselectOne") 
	@ResponseBody
	public PtaskVo selectOne(PnoTnoParam pnoTnoParam) {
		return ptaskService.selectOneInner(pnoTnoParam);
	}
	
	@GetMapping("updateTstatus")
	@ResponseBody
	public int updateTstatus(PnoTnoParam pnoTnoParam) {
		return ptaskService.update(pnoTnoParam);
	}
	
}
