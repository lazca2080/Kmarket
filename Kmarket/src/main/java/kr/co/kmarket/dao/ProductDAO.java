package kr.co.kmarket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBCP;
import kr.co.kmarket.db.Indexsql;
import kr.co.kmarket.db.ProductSql;
import kr.co.kmarket.vo.CategoryVO;
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

	//상품 항목 리스트 조회
	public List<ProductVO> selectProducts(int limiteStart, String cate1, String cate2, String sort) {
		
		List<ProductVO> products = new ArrayList<>();
		
		try {
			logger.debug("selectProduct...");
			Connection conn = DBCP.getConnection();
			
			PreparedStatement psmt = null;
			
			if(sort == null) {
				psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCTS);
				psmt.setString(1, cate1);
				psmt.setString(2, cate2);
				psmt.setInt(3, limiteStart);
			}else if(sort.equals("sold")) {
				psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCTS_SOLD);
				psmt.setString(1, cate1);
				psmt.setString(2, cate2);
				psmt.setInt(3, limiteStart);
			}else if(sort.equals("ascSold")) {
				psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCTS_SELLPRICE_DOWN);
				psmt.setString(1, cate1);
				psmt.setString(2, cate2);
				psmt.setInt(3, limiteStart);
			}else if(sort.equals("descSold")) {
				psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCTS_SELLPRICE_up);
				psmt.setString(1, cate1);
				psmt.setString(2, cate2);
				psmt.setInt(3, limiteStart);
			}else if(sort.equals("score")) {
				psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCTS_SELLPRICE_SCORE);
				psmt.setString(1, cate1);
				psmt.setString(2, cate2);
				psmt.setInt(3, limiteStart);
			}else if(sort.equals("review")) {
				psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCTS_SELLPRICE_REVIEW);
				psmt.setString(1, cate1);
				psmt.setString(2, cate2);
				psmt.setInt(3, limiteStart);
			}else if(sort.equals("rdate")) {
				psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCTS_SELLPRICE_RDATE);
				psmt.setString(1, cate1);
				psmt.setString(2, cate2);
				psmt.setInt(3, limiteStart);
			}
			
			logger.info("sort : "+sort);
			logger.info("selctCate1 : "+cate1);
			logger.info("selctCate2 : "+cate2);
			logger.info("selectlimit : "+limiteStart);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
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
				vo.setScore(rs.getString(15));
				vo.setThumb1(rs.getString(17));
				vo.setSellPrice(rs.getInt(33));
				vo.setLevel(rs.getString(34));
				
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
	
	//단일 상품 조회
	public ProductVO selectProduct(String prodNo) {
		
		ProductVO vo = null;
		
		try {
			logger.debug("selectProduct...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCT);
			psmt.setString(1, prodNo);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new ProductVO();
				vo.setProdNo(rs.getString(1));
				vo.setProdCate1(rs.getString(2));
				vo.setProdCate2(rs.getString(3));
				vo.setProdName(rs.getString(4));
				vo.setDescript(rs.getString(5));
				vo.setCompany(rs.getString(6));
				vo.setPrice(rs.getString(8));
				vo.setDiscount(rs.getString(9));
				vo.setPoint(rs.getString(10));
				vo.setDelivery(rs.getString(13));
				vo.setThumb1(rs.getString(17));
				vo.setThumb2(rs.getString(18));
				vo.setDetail(rs.getString(19));
				vo.setStatus(rs.getString(21));
				vo.setDuty(rs.getString(21));
				vo.setReceipt(rs.getString(22));
				vo.setBizType(rs.getString(23));
				vo.setOrigin(rs.getString(24));
				vo.setSellPrice(rs.getString(33));
				vo.setC1Name(rs.getString(34));
				vo.setC2Name(rs.getString(35));
			}
			
			conn.close();
			psmt.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return vo;
	}
	
	//상품 총 갯수 조회
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

	//상품 네비게이션
	public CategoryVO selectCate(String cate1, String cate2) {
		
		CategoryVO vo = null;
		
		try {
			logger.debug("seleceCate...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(ProductSql.SELECT_CATE);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new CategoryVO();
				vo.setCate1(rs.getInt(1));
				vo.setC1Name(rs.getString(2));
				vo.setCate2(rs.getInt(4));
				vo.setC2Name(rs.getString(5));
			}
			
			psmt.close();
			conn.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return vo;
	}
	
	//장바구니 등록
	public int updateCart(String uid, String count, String prodNo) {
		int result = 0;
		try {
			logger.debug("updateCart....");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(ProductSql.UPDATE_PRODUCT_CART);
			psmt.setString(1, uid);
			psmt.setString(2, count);
			psmt.setString(3, count);
			psmt.setString(4, prodNo);
			
			
			result = psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	//장바구니 목록
	public List<ProductVO> selectProductCart(String uid) {
		
		List<ProductVO> carts = new ArrayList<>();
		
		try {
			logger.debug("selectProductCart...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(ProductSql.SELECT_PRODUCTS_CART);
			psmt.setString(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setThumb1(rs.getString(1));
				vo.setProdName(rs.getString(2));
				vo.setDescript(rs.getString(3));
				vo.setCount(rs.getInt(4));
				vo.setPrice(rs.getString(5));
				vo.setDiscount(rs.getString(6));
				vo.setPoint(rs.getString(7));
				vo.setDelivery(rs.getString(8));
				vo.setSellPrice(rs.getString(9));
				vo.setProdNo(rs.getString(10));
				vo.setTotal(rs.getInt(11));
				vo.setCartNo(rs.getInt(12));
				
				carts.add(vo);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return carts;
	}
	
	//장바구니 삭제
	public int deleteCart(String cartNo) {
		int cart = 0;
		try {
			logger.debug("deleteCart...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt =conn.prepareStatement(ProductSql.DELETE_PRODUCT_CART);
			psmt.setString(1, cartNo);
			cart = psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		int result = cart;
		
		return result;
	}
	
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
	
	public Map<String, Object> selectCategory() {
		
		Map<String, Object> map = null;
		List<CategoryVO> cate10 = null;
		List<CategoryVO> cate11 = null;
		List<CategoryVO> cate12 = null;
		List<CategoryVO> cate13 = null;
		List<CategoryVO> cate14 = null;
		List<CategoryVO> cate15 = null;
		List<CategoryVO> cate16 = null;
		List<CategoryVO> cate17 = null;
		List<CategoryVO> cate18 = null;
		
		try {
			logger.debug("selectCategory...");
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Indexsql.SELECT_CATEGORY);
			
			cate10 = new ArrayList<>();
			cate11 = new ArrayList<>();
			cate12 = new ArrayList<>();
			cate13 = new ArrayList<>();
			cate14 = new ArrayList<>();
			cate15 = new ArrayList<>();
			cate16 = new ArrayList<>();
			cate17 = new ArrayList<>();
			cate18 = new ArrayList<>();
			
			while(rs.next()) {
				CategoryVO vo = new CategoryVO();
				int cate = rs.getInt(1);
				vo.setCate1(rs.getInt(1));
				vo.setC1Name(rs.getString(2));
				vo.setCate2(rs.getInt(4));
				vo.setC2Name(rs.getString(5));
				
				switch(cate) {
					case 10 :
						cate10.add(vo);
						break;
					
					case 11 :
						cate11.add(vo);
						break;
						
					case 12 :
						cate12.add(vo);
						break;
						
					case 13 :
						cate13.add(vo);
						break;
						
					case 14 :
						cate14.add(vo);
						break;
						
					case 15 :
						cate15.add(vo);
						break;
						
					case 16 :
						cate16.add(vo);
						break;
						
					case 17 :
						cate17.add(vo);
						break;
						
					case 18 :
						cate18.add(vo);
						break;
				}
				
			}
			
			map = new HashMap<>();
			map.put("cate10", cate10);
			map.put("cate11", cate11);
			map.put("cate12", cate12);
			map.put("cate13", cate13);
			map.put("cate14", cate14);
			map.put("cate15", cate15);
			map.put("cate16", cate16);
			map.put("cate17", cate17);
			map.put("cate18", cate18);
			
			conn.close();
			stmt.close();
			rs.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return map;
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
				vo.setProdNo(rs.getString(1));
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
