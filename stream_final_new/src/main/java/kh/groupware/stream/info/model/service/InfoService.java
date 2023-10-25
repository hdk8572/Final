package kh.groupware.stream.info.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.groupware.stream.info.model.vo.InfoPageVo;
import kh.groupware.stream.info.model.vo.InfoVo;

@Service
public interface InfoService {
	
	int InfoInsert(InfoVo vo);
	List<InfoVo> InfoList(String userId);
	InfoVo InfoOne(String ino);
	int InfoDelete(String userId);
	int InfoUpdate(InfoVo vo);
	InfoVo InfoWriter(String userId);
	List<InfoVo> InfoSearch(String userId, String ititle, String iwriter);
	int CountInfo();
	List<InfoVo> PagingInfo(InfoPageVo vo);
}
