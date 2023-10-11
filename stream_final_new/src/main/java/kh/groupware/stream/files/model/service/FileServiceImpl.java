package kh.groupware.stream.files.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.groupware.stream.files.model.dao.FileDao;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDao fileDao;

	@Override
	public int savedFile(MultipartFile upload) {
		int uploadFile = fileDao.savedFile(upload);
		return uploadFile;
	}
	
//	@Override
//	public int savedFile(MultipartFile upload) {
//		return fileDao.savedFile(upload);
//	}
	
	
	
}
