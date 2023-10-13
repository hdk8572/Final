package kh.groupware.stream.files.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.files.model.vo.FileVo;
import kh.groupware.stream.ptask.model.vo.PtaskVo;

@Repository
public class FileDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int savedFile(PtaskVo vo) {
		return sqlSession.insert("file.savedFile", vo);
	}
	
}
