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

import kr.co.kmarket.db.DBCP;
import kr.co.kmarket.db.Indexsql;
import kr.co.kmarket.vo.CategoryVO;
import kr.co.kmarket.vo.ProductVO;

public class IndexDAO {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public List<CategoryVO> selectCate(int cate) {
		
		List<CategoryVO> category = new ArrayList<>();
		
		try {
			logger.debug("seleceCate...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Indexsql.SELECT_CATE);
			psmt.setInt(1, cate);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				CategoryVO vo = new CategoryVO();
				vo.setCate1(rs.getInt(1));
				vo.setC1Name(rs.getString(2));
				vo.setCate2(rs.getInt(4));
				vo.setC2Name(rs.getString(5));
				
				category.add(vo);
			}
			
			conn.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return category;
	}
	
	public List<CategoryVO> selectCategory() {
		
		List<CategoryVO> category = new ArrayList<>();
		
		try {
			logger.debug("selectCategory...");
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Indexsql.SELECT_CATEGORY);
			
			while(rs.next()) {
				CategoryVO vo = new CategoryVO();
				vo.setCate1(rs.getInt(1));
				vo.setC1Name(rs.getString(2));
				vo.setCate2(rs.getInt(4));
				vo.setC2Name(rs.getString(5));
				
				category.add(vo);
			}
			
			conn.close();
			stmt.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return category;
	}
	
	public List<CategoryVO> selectCate1() {
		
		List<CategoryVO> category = new ArrayList<>();
		
		try {
			logger.debug("selectCate1...");
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Indexsql.SELECT_CATE1);
			
			while(rs.next()) {
				CategoryVO vo = new CategoryVO();
				vo.setCate1(rs.getInt(1));
				vo.setC1Name(rs.getString(2));
				
				category.add(vo);
			}
			
			conn.close();
			stmt.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return category;
	}
	
	public List<ProductVO> selectIndex() {
		
		List<ProductVO> index = new ArrayList<>();
		
		try {
			logger.debug("selectBest...");
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Indexsql.SELECT_BEST);
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setProdCate1(rs.getString(2));
				vo.setProdCate2(rs.getString(3));
				vo.setProdName(rs.getString(4));
				vo.setDescript(rs.getString(5));
				vo.setPrice(rs.getInt(8));
				vo.setDiscount(rs.getInt(9));
				vo.setDelivery(rs.getInt(13));
				vo.setThumb1(rs.getString(17));
				vo.setThumb2(rs.getString(18));
				vo.setSellPrice(rs.getString(33));
				
				index.add(vo);
			}
			
			conn.close();
			stmt.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return index;
	}
}
