package kr.co.kmarket.db;

public class ProductSql {

	/* 오타 찾아내서 고치면 됨!
	public static final String insertProduct1 = "INSERT INTO `km_product` SET"
			+ "`prodCate1`=? "
			+ "`prodCate2`=? "
			+ "`prodName`=? "
			+ "`descript`=? "
			+ "`company`=? "
			+ "`price`=? "
			+ "`discount`=? "
			+ "`point`=? "
			+ "`stock`=? "
			+ "`delivery`=? "
			+ "`status`=? "
			+ "`duty`=? "
			+ "`receipt`=? "
			+ "`bizType`=? "
			+ "`origin`=? "
			+ "`ip`=? "
			+ "`thumb1`=? "
			+ "`thumb2`=? "
			+ "`thumb3`=? "
			+ "`detail`=? "
			+ "`rdate`=NOW()"; */
	
	// 상품 등록
	public static final String insertProduct = "INSERT INTO `km_product` (`prodCate1`,`prodCate2`,`prodName`,`descript`,`company`,`price`,`discount`,`point`,`stock`,`delivery`,`status`,`duty`,`receipt`,`bizType`,`origin`,`ip`,`thumb1`,`thumb2`,`thumb3`,`detail`,`seller`,`sellPrice`,`rdate`)"
			+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW())";

	// 상품 번호 조회
	public static final String selectProdNo = "SELECT MAX(`prodNo`) FROM `km_product`";
	
	// 상품 번호에 해당하는 상품 조회 및 카테고리 이름 조회
	public static final String SELECT_PRODUCT = "SELECT A.*, B.`c1Name`, C.`c2Name` FROM `km_product` AS A "
												+ "JOIN `km_product_cate1` AS B ON `prodCate1` = B.`cate1` "
												+ "JOIN `km_product_cate2` AS C ON `prodCate2` = C.`cate2` AND `prodCate1` = C.`cate1` "
												+ "WHERE `prodNo`=?";
	
	//판매량
	public static final String SELECT_PRODUCTS_SOLD = "SELECT * FROM `km_product` WHERE `prodCate1`=? and `prodCate2`=? "
													+ "order by `sold` desc "
													+ "limit ?, 10";
	
	//가격 낮은순
	public static final String SELECT_PRODUCTS_SELLPRICE_DOWN = "SELECT * FROM `km_product` WHERE `prodCate1`=? and `prodCate2`=? "
															+ "order by `sellPrice` asc "
															+ "limit ?, 10";
	
	//가격 높은순
	public static final String SELECT_PRODUCTS_SELLPRICE_up = "SELECT * FROM `km_product` WHERE `prodCate1`=? and `prodCate2`=? "
															+ "order by `sellPrice` desc "
															+ "limit ?, 10";
	
	//평점 높은순
	public static final String SELECT_PRODUCTS_SELLPRICE_SCORE = "SELECT * FROM `km_product` WHERE `prodCate1`=? and `prodCate2`=? "
															  + "order by `score` desc "
															  + "limit ?, 10";
	
	//리뷰 많은순
	public static final String SELECT_PRODUCTS_SELLPRICE_REVIEW = "SELECT * FROM `km_product` WHERE `prodCate1`=? and `prodCate2`=? "
																+ "order by `review` desc "
																+ "limit ?, 10";
	
	//최근등록순
	public static final String SELECT_PRODUCTS_SELLPRICE_RDATE = "SELECT * FROM `km_product` WHERE `prodCate1`=? and `prodCate2`=? "
																+ "order by `rdate` desc "
																+ "limit ?, 10";
	
	//게시글 총 갯수
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`prodNo`) FROM `km_product` where `prodCate1`=? and `prodCate2`=?";
	
	//상품 네비게이션
	public static final String SELECT_CATE = "SELECT * FROM `km_product_cate1` AS a JOIN `km_product_cate2` AS b ON a.cate1 = b.cate1 WHERE a.`cate1`=? and b.cate2=?";
	
	//장바구니 목록
	public static final String SELECT_PRODUCTS_CART = "SELECT a.thumb1, a.prodName, a.descript, b.`count`, a.price, b.discount, b.`point`, b.delivery, a.sellPrice "
													+ "FROM `km_product` AS a "
													+ "JOIN `km_product_cart` AS b "
													+ "ON a.prodNo=b.prodNo "
													+ "WHERE `uid`=?";
	
}
