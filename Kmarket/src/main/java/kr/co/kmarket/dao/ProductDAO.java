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
			PreparedStatement psmt = conn.prepareStatement(ProductSql.insertProduct2);
			psmt.setString(1, vo.getProdCate1());
			psmt.setString(2, vo.getProdCate2());
			psmt.setString(3, vo.getProdName());
			psmt.setString(4, vo.getDescript());
			psmt.setString(5, vo.getCompany());
			psmt.setInt(6, vo.getPrice());
			psmt.setInt(7, vo.getDiscount());
			psmt.setInt(8, vo.getPoint());
			psmt.setInt(9, vo.getStock());
			psmt.setInt(10, vo.getDeilvery());
			psmt.setString(11, vo.getStatus());
			psmt.setString(12, vo.getDuty());
			psmt.setString(13, vo.getReceipt());
			psmt.setString(14, vo.getBizType());
			psmt.setString(15, vo.getOrigin());
			psmt.setString(16, vo.getRegip());
			psmt.setString(17, vo.getThumb1());
			psmt.setString(18, vo.getThumb2());
			psmt.setString(19, vo.getThumb3());
			psmt.setString(20, vo.getDetail());
			psmt.setString(21, vo.getSeller());
			
			psmt.executeUpdate();
			
			conn.close();
			psmt.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
	}
}
