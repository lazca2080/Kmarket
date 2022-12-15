package kr.co.kmarket.service;

import kr.co.kmarket.dao.CsDAO;
import kr.co.kmarket.vo.CsVO;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public enum CsService {
	INSTANCE;
	private CsDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private CsService() {
		dao = new CsDAO();
	}
	
	/*** cs - index ***/
	// 최신글 리스트 5건 출력하기
	public List<CsVO> selectLatests(String cate1, String cate2, String cate3) {
		return dao.selectLatests(cate1, cate2, cate3);
	}
	
	/*** cs - qna ***/
	// 문의글 작성하기
	public int insertArticle(CsVO article) {
		logger.info("service-insertArticle...");
		return dao.insertArticle(article);
	}
	
	
	
	
	
	
}
