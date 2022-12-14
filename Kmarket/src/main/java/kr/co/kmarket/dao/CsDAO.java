package kr.co.kmarket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
			logger.info("selectLatests...");
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
	
	
	
	
	
	
}
