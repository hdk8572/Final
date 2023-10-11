package kh.groupware.stream.files.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class FileDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int savedFile(MultipartFile upload) {
		return sqlSession.insert("file.savedFile", upload);
	}
	
}
