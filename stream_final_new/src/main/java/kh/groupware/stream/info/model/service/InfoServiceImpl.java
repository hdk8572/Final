package kh.groupware.stream.info.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.groupware.stream.info.model.dao.InfoDao;
import kh.groupware.stream.info.model.vo.InfoVo;

@Service
public class InfoServiceImpl implements InfoService{
	@Autowired
	private InfoDao dao;

	@Override
	public int InfoInsert(InfoVo vo) {
		return dao.InfoInsert(vo);
	}

	@Override
	public List<InfoVo> InfoList(String userId) {
		return dao.InfoList(userId);
	}

	@Override
	public InfoVo InfoOne(String ino) {
		return dao.InfoOne(ino);
	}

	@Override
	public int InfoDelete(String userId) {
		return dao.InfoDelete(userId);
	}

	@Override
	public int InfoUpdate(InfoVo vo) {
		return dao.InfoUpdate(vo);
	}

	@Override
	public InfoVo InfoWriter(String userId) {
		
		return dao.InfoWriter(userId);
	}

	@Override
	public List<InfoVo> InfoSearch(String userId, String ititle, String iwriter) {
	
		return dao.InfoSearch(userId, ititle, iwriter);
	}

//	@Override
//	public int InfoCnt(String userId) {
//		return dao.InfoCnt(userId);
//	}
}
