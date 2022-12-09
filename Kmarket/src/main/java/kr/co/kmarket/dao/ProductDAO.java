package kr.co.kmarket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBCP;
import kr.co.kmarket.db.ProductSql;
import kr.co.kmarket.vo.ProductVO;

public class ProductDAO {
	
	org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertProduct(ProductVO vo) {
		
		try {
			logger.debug("insertProduct...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(ProductSql.insertProduct);
			psmt.setString(1, vo.getCate1());
			psmt.setString(2, vo.getCate2());
			psmt.setString(3, vo.getText());
			psmt.setString(4, vo.getCompany());
			psmt.setInt(5, vo.getPrice());
			psmt.setInt(6, vo.getDis());
			psmt.setInt(7, vo.getPoint());
			psmt.setString(8, vo.getCate1());
			psmt.setString(9, vo.getCate1());
			psmt.setString(10, vo.getCate1());
			psmt.setString(11, vo.getCate1());
			psmt.setString(12, vo.getCate1());
			psmt.setString(13, vo.getCate1());
			psmt.setString(14, vo.getCate1());
			psmt.setString(15, vo.getCate1());
			psmt.setString(16, vo.getCate1());
			psmt.setString(17, vo.getCate1());
			psmt.setString(18, vo.getCate1());
			psmt.setString(19, vo.getCate1());
			psmt.setString(20, vo.getCate1());
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
	}
}
