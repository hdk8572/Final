package kh.groupware.stream.files.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.groupware.stream.files.model.dao.FileDao;
import kh.groupware.stream.files.model.vo.FileVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDao fileDao;

	@Override
	public int savedFile(PtaskVo vo) {
		int uploadFile = fileDao.savedFile(vo);
		return uploadFile;
	}
	
//	@Override
//	public int savedFile(FileVo vo) {
//		int uploadFile = fileDao.savedFile(vo);
//		return uploadFile;
//	}
}
