package kh.groupware.stream.files.model.service;

import org.springframework.web.multipart.MultipartFile;

import kh.groupware.stream.files.model.vo.FileVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

public interface FileService {

	public int savedFile(PtaskVo vo);
	
}
