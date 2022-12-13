package kr.co.kmarket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
				cv.setCateType1(rs.getString(2));
				cv.setTitle(rs.getString(3));
				cv.setUid(rs.getString(4));
				cv.setRdate(rs.getString(5));
				
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
	
	
	
	
	
	
	
	
}
