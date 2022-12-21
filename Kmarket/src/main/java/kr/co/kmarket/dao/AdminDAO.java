package kr.co.kmarket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.AdminSql;
import kr.co.kmarket.db.DBCP;
import kr.co.kmarket.vo.ProductVO;

public class AdminDAO {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public List<ProductVO> selectProducts(int start,String search) {
		List<ProductVO> products = new ArrayList<>();
		
		try {
			logger.debug("selectProducts...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = null;
			if(search == null) {
				psmt = conn.prepareStatement(AdminSql.selectProduct);
				psmt.setInt(1, start);
			}else if(search == "prodName") {
				psmt = conn.prepareStatement(AdminSql.selectProduct1);
				psmt.setInt(1, start);
			}else if(search == "prodNo") {
				psmt = conn.prepareStatement(AdminSql.selectProduct2);
				psmt.setInt(1, start);
			}else if(search == "company") {
				psmt = conn.prepareStatement(AdminSql.selectProduct3);
				psmt.setInt(1, start);
			}else if(search == "seller") {
				psmt = conn.prepareStatement(AdminSql.selectProduct4);
				psmt.setInt(1, start);
			}
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
				product.setSeller(rs.getString(7));
				product.setHit(rs.getInt(14));
				
				products.add(product);
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
				product.setSeller(rs.getString(7));
				product.setHit(rs.getInt(14));
				
				
				products.add(product);
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
	
	public int selectCountTotal(String seller,String search) {
		int total = 0;
		
		try {
			logger.info("selectCountTotal...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = null;
			
			if(search == null){
				psmt = conn.prepareStatement(AdminSql.SELECT_COUNT_TOTAL);
				psmt.setString(1, seller);
			}else {
				psmt = conn.prepareStatement(AdminSql.select_count_total_for_search);
				psmt.setString(1, "%"+search+"%");
				psmt.setString(2, "%"+search+"%");
				psmt.setString(3, seller);
			}
			
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
	
	// 삭제
	public int delectProduct(String prodNo) {
		int result = 0;
		try {
			logger.info("delectProduct..");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(AdminSql.DELECT_PRODUCT);
			psmt.setString(1, prodNo);
			result = psmt.executeUpdate();
			conn.close();
			psmt.close();
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	 //키워드
	 public List<ProductVO> selectProductKeyword(String keyword,int start) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectProductKeyword...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(AdminSql.select_Product_Keyword);
			psmt.setString(1, "%"+keyword+"%");
			psmt.setString(2, "%"+keyword+"%");
			psmt.setInt(3, start);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				ProductVO product = new ProductVO();
				product.setThumb1(rs.getString(17));
				product.setProdNo(rs.getInt(1));
				product.setProdName(rs.getString(4));
				product.setPrice(rs.getString(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSeller(rs.getString(7));
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
	
	
	
}
