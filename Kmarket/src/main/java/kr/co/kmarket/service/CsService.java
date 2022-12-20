package kr.co.kmarket.service;

import kr.co.kmarket.dao.CsDAO;
import kr.co.kmarket.vo.CsVO;

import java.util.List;
import java.util.Map;

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
	
	
	/*** cs - list ***/
	// 현재 페이지 번호
	public int getCurrentPage(String pg) {
		int currentPage = 1;	// 현재 페이지 기본값
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	// 전체 게시물 개수
	public int selectCountTotal(String cate) {
		return dao.selectCountTotal(cate);
	}
	// 마지막 페이지 번호
	public int getLastPageNum(int total) {
		int lastPageNum = 0; // 마지막 페이지
		if(total % 10 == 0) {
			lastPageNum = (total/10);
		}else {
			lastPageNum = (total/10)+1;
		}
		return lastPageNum;
	}
	// 현재 페이지 게시글 시작값 
	public int getLimitStart(int currentPage) {
		int limitStart = 0;
		limitStart = (currentPage-1)*10;
		return limitStart;
	}
	// 페이지 그룹 
	public int[] getPageGroupNum(int currentPage, int lastPageNum) {
		int pageGroupCurrent = (int) Math.ceil(currentPage/10.0);
		int pageGroupStart = (pageGroupCurrent - 1)*10+1;
		int pageGroupEnd = pageGroupCurrent * 10;
		
		if(pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}
		
		int[] result = {pageGroupStart,pageGroupEnd};
		return result;
	}
	// 페이지 시작 번호
	public int getPageStartNum(int total, int limitStart) {
		int pageStartNum = 0;
		pageStartNum = total - limitStart;
		return pageStartNum;
	}
	// 게시글 번호 정렬
	public int getStartNum(int currentPage) {
		return (currentPage-1)*10;
	}
	
	// 페이지 글 가져오기
	public List<CsVO> selectArticles(String cate, String cateType1, int start){
		return dao.selectArticles(cate, cateType1, start);
	}
	
	/*** cs::faq list ***/
	// cate - cateType1
	public List<CsVO> selectFaqArticles(String cate, String cateType1){
		logger.info("selectFaqArticles");
		return dao.selectFaqArticles(cate, cateType1);
	}
	
	
//	public Map<String, Object> selectFaqArticles(String cateType1, int num){
//	return dao.selectFaqArticles(cateType1, num);
//}
	
	
	/*** cs - view ***/
	public CsVO selectArticle(String no) {
		logger.info("selectArticle");
		return dao.selectArticle(no);
	}
	
	
	/*** admin - index - main ***/
	public CsVO selectAdminMain() {
		return dao.selectAdminMain();
	}
	
	/*** admin - cs - index - notice, qna 출력  ***/
	public Map<String, Object> selectNoticeQna() {
		return dao.selectNoticeQna();
	}
	
	/*** admiin - cs - notice - modify 
	 * @return ***/
	public CsVO updateArticle(CsVO article) {
		return dao.updateArticle(article);
	}

	
	/*** 글 삭제 ***/
	public void deleteArticle(String no) {
		dao.deleteArticle(no);
	}
	
	
	
	
	
	
	
	
	
	
	
}
