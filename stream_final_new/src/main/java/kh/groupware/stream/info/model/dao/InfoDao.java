package kh.groupware.stream.info.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.groupware.stream.info.model.vo.InfoPageVo;
import kh.groupware.stream.info.model.vo.InfoVo;



@Repository
public class InfoDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int InfoInsert(InfoVo vo) {
		return sqlSession.insert("info.infoInsert",vo);
	}
	public List<InfoVo> InfoList(String userId){
		return sqlSession.selectList("info.infoList",userId);
	}
	public InfoVo InfoOne(String ino) {
		return sqlSession.selectOne("info.infoOne",ino);
	}
	public int InfoDelete(String userId) {
		return sqlSession.delete("info.infoDelete",userId);
	}
	public int InfoUpdate(InfoVo vo) {
		return sqlSession.update("info.infoUpdate",vo);
	}
//	public int InfoCnt(String userId) {
//		return sqlSession.selectOne("info.infoCnt",userId);
//	}
	public InfoVo InfoWriter(String userId) {
		return sqlSession.selectOne("info.infowriter",userId);
	}
	public List<InfoVo> InfoSearch(String userId, String ititle, String iwriter) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("userId", userId);
	    paramMap.put("ititle", ititle);
	    paramMap.put("iwriter", iwriter);
	    return sqlSession.selectList("info.infosearch", paramMap);
	}
	public int CountInfo() {
		return sqlSession.selectOne("info.countInfo");
	}
	public List<InfoVo> PagingInfo(InfoPageVo vo){
		return sqlSession.selectList("info.selectInfo",vo);
	}
}
