package kr.co.kmarket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.AdminSql;
import kr.co.kmarket.db.DBCP;
import kr.co.kmarket.db.ProductSql;
import kr.co.kmarket.vo.ProductVO;

public class AdminDAO {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ProductVO selectProducts(int level) {
		
		ProductVO vo = null;
		
		try {
			logger.debug("selectProducts...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(AdminSql.selectProduct);
			psmt.setInt(1, level);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new ProductVO();
				vo.setProdName(rs.getString(4));
				vo.setDescript(rs.getString(5));
				vo.setCompany(rs.getString(6));
				vo.setSeller(rs.getString(7));
				vo.setPrice(rs.getString(8));
				vo.setDiscount(rs.getString(9));
				vo.setPoint(rs.getString(10));
				vo.setStock(rs.getString(11));
				vo.setDelivery(rs.getString(13));
				vo.setThumb1(rs.getString(17));
				vo.setThumb2(rs.getString(18));
				vo.setThumb3(rs.getString(19));
				vo.setDetail(rs.getString(20));
			}
			conn.close();
			psmt.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return vo;
	}
	
	public List<ProductVO> selectProductss(int limitestart,String uid) {
		
		List<ProductVO> products = new ArrayList<>();
		
		try {
			logger.debug("selectProductss...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(AdminSql.selectProductss);
			psmt.setString(1, uid);
			psmt.setInt(2, limitestart);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setThumb1(rs.getString(17));
				product.setProdNo(rs.getInt(1));
				product.setProdName(rs.getString(4));
				product.setPrice(rs.getString(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setHit(rs.getInt(14));
				
				products.add(product);
			}
			
			conn.close();
			psmt.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return products;
	}
	
	public int selectCountTotal(String seller) {
		int total = 0;
		try {
			logger.info("selectCountTotal...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(AdminSql.SELECT_COUNT_TOTAL);
			psmt.setString(1, seller);
			
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
	
	public List<ProductVO> selectAdminList(String seller, int limiteStart) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectAdminList...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(AdminSql.SELECT_ADMIN_LIST);
			psmt.setString(1, seller);
			logger.info("seller : " +seller);
			psmt.setInt(2, limiteStart);
			logger.info("limiteStart : " +limiteStart);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()){
				ProductVO vo = new ProductVO();
				vo.setProdNo(rs.getString(1));
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
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("product size : " +products.size());
		return products;
	}
	
	/* 키워드
	 * public List<ProductVO> selectProductKeyword(String uid,String keyword) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectProductKeyword...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(AdminSql.selectProductKeyword);
			psmt.setString(1, "%"+keyword+"%");
			psmt.setString(1, "%"+keyword+"%");
			psmt.setString(3, uid);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setProdName(rs.getString(4));
				product.setCompany(rs.getString(6));
				product.setDescript(rs.getString(5));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getString(8));
				product.setDiscount(rs.getString(9));
				product.setPoint(rs.getString(10));
				product.setStock(rs.getString(11));
				product.setDelivery(rs.getString(13));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				
				products.add(product);
			}
			
			conn.close();
			psmt.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return products;
	}
	*/
	
	
}
