package kr.co.kmarket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.CsSql;
import kr.co.kmarket.db.DBCP;
import kr.co.kmarket.vo.CsVO;

public class CsDAO {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/*** cs - index ***/
	// notice + qna 최신글 리스트 5건 출력하기 
	public List<CsVO> selectLatests(String cate1, String cate2, String cate3){
		List<CsVO> latests = new ArrayList<>();
		try {
			logger.info("selectLatests");
			Connection con = DBCP.getConnection();
			PreparedStatement psmt = con.prepareStatement(CsSql.SELECT_LATESTS);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			psmt.setString(3, cate3);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				CsVO cv = new CsVO();
				cv.setNo(rs.getInt(1));
				cv.setCate(rs.getString(2));
				cv.setCateType1(rs.getString(3));
				cv.setCateType2(rs.getString(4));
				cv.setTitle(rs.getString(5));
				cv.setUid(rs.getString(6));
				cv.setRdate(rs.getString(7));
				
				latests.add(cv);
			}
			rs.close();
			psmt.close();
			con.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return latests;
	}
	
	/*** cs - qna ***/
	// 문의글 작성하기
	public int insertArticle(CsVO article) {
		
		int result = 0;
		
		try {
			
			logger.info("insertArticle...");
			
			Connection con = DBCP.getConnection();
			
			// 트랜잭션
			con.setAutoCommit(false);
			
			PreparedStatement psmt = con.prepareStatement(CsSql.INSERT_ARTICLE);
			Statement stmt = con.createStatement();
			
			psmt.setString(1, article.getCate());
			psmt.setString(2, article.getCateType1());
			psmt.setString(3, article.getCateType2());
			psmt.setString(4, article.getTitle());
			psmt.setString(5, article.getContent());
			psmt.setString(6, article.getUid());
			psmt.setString(7, article.getRegip());

			psmt.executeUpdate();
			ResultSet rs = stmt.executeQuery(CsSql.SELECT_MAX_NO);

			con.commit();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			con.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}

	/*** cs - list ***/
	// 전체 게시물 개수
	public int selectCountTotal(String cate) {
		int total = 0;
		try {
			logger.info("CsDAO-selectCountTotal...");
			
			Connection con = DBCP.getConnection();
			
			PreparedStatement psmt = con.prepareStatement(CsSql.SELECT_COUNT_TOTAL);
			psmt.setString(1, cate);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				total = rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			con.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}
	// 페이지 글 가져오기
	public List<CsVO> selectArticles(String cate, String cateType1, int start){
		List<CsVO> articles = new ArrayList<>();
		try {
			logger.info("CsDAO-selectArticles...");
			
			Connection con = DBCP.getConnection();
			PreparedStatement psmt = null;
			
			if(cateType1 == null) {
				 psmt = con.prepareStatement(CsSql.SELECT_WHOLE_ARTICLES);
				 psmt.setInt(1, start);
			}else {
				psmt = con.prepareStatement(CsSql.SELECT_ARTICLES);
				psmt.setString(1, cate);
				psmt.setString(2, cateType1);
				psmt.setInt(3, start);
			}
			
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				CsVO article = new CsVO();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setCate(rs.getString(3));
				article.setCateType1(rs.getString(4));
				article.setCateType2(rs.getString(5));
				article.setTitle(rs.getString(6));
				article.setContent(rs.getString(7));
				article.setUid(rs.getString(8));
				article.setRegip(rs.getString(9));
				article.setRdate(rs.getString(10));
				
				articles.add(article);
				
			}
			rs.close();
			psmt.close();
			con.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}

	/*** cs::faq list ***/
	// cate - cateType1
	public List<CsVO> selectFaqArticles(String cate, String cateType1){
		List<CsVO> articles = new ArrayList<>();
		try {
			
			logger.info("selectFaqArticles");
			
			Connection con = DBCP.getConnection();
			PreparedStatement psmt = con.prepareStatement(CsSql.SELECT_FAQ_ARTICLES);
			psmt.setString(1, cate);
			psmt.setString(2, cateType1);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsVO article = new CsVO();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setCate(rs.getString(3));
				article.setCateType1(rs.getString(4));
				article.setCateType2(rs.getString(5));
				article.setTitle(rs.getString(6));
				article.setContent(rs.getString(7));
				article.setUid(rs.getString(8));
				article.setRegip(rs.getString(9));
				article.setRdate(rs.getString(10));
				
				articles.add(article);
			}
			
			rs.close();
			psmt.close();
			con.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	
	
	/*** cs - view ***/
	public CsVO selectArticle(String no) {
		CsVO vo = null;
		
		try {
			logger.info("selectArticle");
			
			Connection con = DBCP.getConnection();
			PreparedStatement psmt = con.prepareStatement(CsSql.SELECT_ARTICLE);
			psmt.setString(1, no);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new CsVO();
				vo.setNo(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setCate(rs.getString(3));
				vo.setCateType1(rs.getString(4));
				vo.setCateType2(rs.getString(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setUid(rs.getString(8));
				vo.setRegip(rs.getString(9));
				vo.setRdate(rs.getString(10));
			}
			
			rs.close();
			psmt.close();
			con.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return vo;
	
	}
	
	

}
