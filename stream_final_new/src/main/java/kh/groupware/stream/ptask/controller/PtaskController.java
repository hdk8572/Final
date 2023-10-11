package kh.groupware.stream.ptask.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import kh.groupware.stream.files.model.service.FileService;
import kh.groupware.stream.files.model.vo.FileVo;
import kh.groupware.stream.project.model.vo.PnoTnoParam;
import kh.groupware.stream.ptask.model.service.PtaskService;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Controller
public class PtaskController {

	@Autowired
	private PtaskService ptaskService;
	
	@Autowired
	private FileService fileService;
	

	@GetMapping("/ptasklist")
	public String ptasklist(Model model, String pno) {
		List<PtaskVo> tlist = ptaskService.pselectList(pno);
		model.addAttribute("pno", pno);
		model.addAttribute("tlist", tlist);
		return "project";
	}

	@PostMapping("/insertPtask")
	@Transactional
	public Map<String, String> insertTask(Model model, PtaskVo vo, MultipartFile upload, HttpServletRequest request) {
		// file server save ==> return savedpath
		
		Map config = new HashMap();
		config.put("cloud_name", "dup9irkxd");
		config.put("api_key", "371128821948137");
		config.put("api_secret", config)
		
		fileService.savedFile(upload);
		ptaskService.insertTask(vo);
		return "redirect:ptasklist?pno="+vo.getPno();
	}
	
	
	@PostMapping("/upload")
	   @ResponseBody
	   public Map<String, String> imageUpload(MultipartFile upload, HttpServletRequest request) {

	      Map config = new HashMap();
	      config.put("cloud_name", "db7cajuz1");
	      config.put("api_key", "712589672878332");
	      config.put("api_secret", "E-Gm0B7UZ3K_c_KYnJRfxHTPwX0");
	      Cloudinary cloudinary = new Cloudinary(config);
	      // cloudinary 사용을 위해 등록(properties 파일 이용)

	      Map<String, String> result = new HashMap<String, String>();
	      OutputStream out = null;
	      // 파일이 비어있지 않고(비어 있다면 null 반환)
	      MultipartFile file = upload;
	      if (file != null) {
	         // 파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐때
	         if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
//	               if (file.getContentType().toLowerCase().startsWith("image/")) {
	            try {
	               // 파일 이름 설정
	               String fileName = file.getOriginalFilename();
	               System.out.println("원래file이름: " + fileName);

	               // 로컬 - 파일이 로컬 서버에 실제로 저장되는 경로
//	                     String uploadPath = request.getServletContext().getRealPath("/resources/ckimage/");
	               // 로컬 - 저장되는 파일에 경로 설정
//	                     File uploadFile = new File(uploadPath);
//	                     if (!uploadFile.exists()) {
//	                        uploadFile.mkdirs();
//	                     }
	               // 로컬 - 파일이름을 랜덤하게 생성
//	                     fileName = UUID.randomUUID().toString()+"_"+fileName;
//	                     System.out.println("바뀐file이름: "+ fileName);
	               // 업로드 경로 + 파일이름을 줘서 데이터를 서버에 전송
//	                     uploadPath = uploadPath + "/" + fileName;

	               // 로컬 - 저장되는 파일에 경로 설정
//	                     upload.transferTo(new File(uploadPath)); // 로컬 파일 저장

	               // 로컬 - 파일이 연결되는 Url 주소 설정
//	                     String fileUrl = uploadPath;
//	                     System.out.println("fileUrl: "+ fileUrl);

	               // 파일서버 - 파일 저장
//	                     Map res = cloudinary.uploader().upload(new File(uploadPath), ObjectUtils.emptyMap()); 
	               File uploadedFile = new File(fileName);
	               file.transferTo(uploadedFile);
	               Map res = cloudinary.uploader().upload(uploadedFile, ObjectUtils.emptyMap());
	               String cloudinaryUrl = res.get("url") == null ? "" : res.get("url").toString();
	               System.out.println("cloudinaryUrl: " + cloudinaryUrl);
	               System.out.println("파일 전송이 완료되었습니다.");
	               result.put("uploaded", "1");
	               result.put("fileName", fileName);
	               result.put("url", cloudinaryUrl);
	            } catch (Exception e) {
	               // TODO: handle exception
	            } finally {
	            }
	         }
	      }
	      return result;
	   }

		/* upload 시도 */
//	@PostMapping("/insertPtask")
//	@Transactional
//	public String insertTask(Model model, PtaskVo vo, MultipartFile upload) {
//		// file server save ==> return savedpath 
//		fileService.savedFile(upload);
//		ptaskService.insertTask(vo);
//		return "redirect:ptasklist?pno="+vo.getPno();
//	}
	
		/* upload 기능 X */
//	@PostMapping("/insertPtask")
//	public String insertTask(Model model, PtaskVo vo, MultipartFile upload) {
//		ptaskService.insertTask(vo);
//		return "redirect:ptasklist?pno="+vo.getPno();
//	}
	
	// 아래는 진짜 암기하자
	/* @GetMapping("/ptaskselectOne")
	@ResponseBody
	public Map<String, Object> selectOne(String pno, String tno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("tno", tno);
		return map;
	} */
	 
	
	@GetMapping("/ptaskselectOne") 
	@ResponseBody
	public PtaskVo selectOne(PnoTnoParam pnoTnoParam) {
		return ptaskService.selectOneInner(pnoTnoParam);
	}
}
