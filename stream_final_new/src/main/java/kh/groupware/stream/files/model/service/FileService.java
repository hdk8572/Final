package kh.groupware.stream.files.model.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	public int savedFile(MultipartFile upload);
	
}
