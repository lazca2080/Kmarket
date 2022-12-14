package kr.co.kmarket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBCP;
import kr.co.kmarket.db.ProductSql;
import kr.co.kmarket.vo.ProductVO;

public class ProductDAO {
	
	org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertProduct(ProductVO vo) {
		
		int prodNo = 0;
		
		try {
			logger.debug("insertProduct...");
			Connection conn = DBCP.getConnection();
			
			// 트랙잭션 시작
			conn.setAutoCommit(false);
			PreparedStatement psmt = conn.prepareStatement(ProductSql.insertProduct);
			Statement stmt = conn.createStatement();
			psmt.setString(1, vo.getProdCate1());
			psmt.setString(2, vo.getProdCate2());
			psmt.setString(3, vo.getProdName());
			psmt.setString(4, vo.getDescript());
			psmt.setString(5, vo.getCompany());
			psmt.setInt(6, vo.getPrice());
			psmt.setInt(7, vo.getDiscount());
			psmt.setInt(8, vo.getPoint());
			psmt.setInt(9, vo.getStock());
			psmt.setInt(10, vo.getDelivery());
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
			psmt.setInt(22, vo.getSellPrice());
			
			psmt.executeUpdate();                                         // INSERT 이후
			ResultSet rs = stmt.executeQuery(ProductSql.selectProdNo);    // SELECT 해야 INSERT한 prodNo 찾기 가능 반대로하면 틀린 prodNO
			conn.commit();
			// 트랜잭션 종료
			
			if(rs.next()) {
				prodNo = rs.getInt(1);
			}
			
			conn.close();
			psmt.close();
			stmt.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return prodNo;
		
	}

	public List<ProductVO> selectProduct(int limiteStart, String cate1, String cate2) {
		
		List<ProductVO> products = new ArrayList<>();
		
		try {
			logger.debug("selectProduct...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCTS);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			psmt.setInt(3, limiteStart);
			
			logger.info("selctCate1 : "+cate1);
			logger.info("selctCate2 : "+cate2);
			logger.info("selectlimit : "+limiteStart);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProdName(rs.getString(4));
				vo.setDescript(rs.getString(5));
				vo.setCompany(rs.getString(6));
				vo.setSeller(rs.getString(7));
				vo.setPrice(rs.getInt(8));
				vo.setDiscount(rs.getInt(9));
				vo.setPoint(rs.getInt(10));
				vo.setDelivery(rs.getString(13));
				vo.setThumb1(rs.getString(17));
				vo.setSellPrice(rs.getInt(33));
				
				products.add(vo);
			}
			
			conn.close();
			psmt.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("products size : " +products.size());
		return products;
	}
	
	public int selectCountTotal(String cate1, String cate2) {
		
		int total = 0;
		
		try {
			logger.info("selectCountTotal...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(ProductSql.SELECT_COUNT_TOTAL);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return total;
	}
}
