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
	
	// cate1, cate2에 해당하는 상품 조회
	public static final String SELECT_PRODUCTS = "SELECT A.*, B.`level` FROM `km_product` AS A "
												+ "JOIN	`km_member` AS B ON A.`seller` = B.`uid` "
												+ "WHERE `prodCate1`=? and `prodCate2`=? LIMIT ?, 10";
	
	// 판매량
	public static final String SELECT_PRODUCTS_SOLD = "SELECT A.*, B.`level` FROM `km_product` AS A "
																+ "JOIN	`km_member` AS B ON A.`seller` = B.`uid` "
																+ "WHERE `prodCate1`=? and `prodCate2`=? ORDER BY `sold` DESC LIMIT ?, 10";
	
	// 가격 낮은순
	public static final String SELECT_PRODUCTS_SELLPRICE_DOWN = "SELECT A.*, B.`level` FROM `km_product` AS A "
																+ "JOIN	`km_member` AS B ON A.`seller` = B.`uid` "
																+ "WHERE `prodCate1`=? and `prodCate2`=? ORDER BY `sellPrice` ASC LIMIT ?, 10";
	
	// 가격 높은순
	public static final String SELECT_PRODUCTS_SELLPRICE_up = "SELECT A.*, B.`level` FROM `km_product` AS A "
																+ "JOIN	`km_member` AS B ON A.`seller` = B.`uid` "
																+ "WHERE `prodCate1`=? and `prodCate2`=? ORDER BY `sellPrice` DESC LIMIT ?, 10";
	
	// 평점 높은순
	public static final String SELECT_PRODUCTS_SELLPRICE_SCORE = "SELECT A.*, B.`level` FROM `km_product` AS A "
																+ "JOIN	`km_member` AS B ON A.`seller` = B.`uid` "
																+ "WHERE `prodCate1`=? and `prodCate2`=? ORDER BY `score` DESC LIMIT ?, 10";
	
	// 리뷰 많은순
	public static final String SELECT_PRODUCTS_SELLPRICE_REVIEW = "SELECT A.*, B.`level` FROM `km_product` AS A "
																+ "JOIN	`km_member` AS B ON A.`seller` = B.`uid` "
																+ "WHERE `prodCate1`=? and `prodCate2`=? ORDER BY `review` DESC LIMIT ?, 10";
	
	// 최근등록순
	public static final String SELECT_PRODUCTS_SELLPRICE_RDATE = "SELECT A.*, B.`level` FROM `km_product` AS A "
																+ "JOIN	`km_member` AS B ON A.`seller` = B.`uid` "
																+ "WHERE `prodCate1`=? and `prodCate2`=? ORDER BY `rdate` DESC LIMIT ?, 10";
	
	// 게시글 총 갯수
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`prodNo`) FROM `km_product` where `prodCate1`=? and `prodCate2`=?";
	
	// 상품 네비게이션
	public static final String SELECT_CATE = "SELECT * FROM `km_product_cate1` AS a JOIN `km_product_cate2` AS b ON a.cate1 = b.cate1 WHERE a.`cate1`=? and b.cate2=?";
	
  // 장바구니 목록
	public static final String SELECT_PRODUCTS_CART = "SELECT a.thumb1, a.prodName, a.descript, b.`count`, b.price, b.discount, b.`point`, b.delivery, a.sellPrice*b.`count`, a.prodNo, b.total, b.`cartNo` "
													+ "FROM `km_product` AS a "
													+ "JOIN `km_product_cart` AS b "
													+ "ON a.prodNo=b.prodNo "
													+ "WHERE `uid`=?";
  
	//장바구니 상품등록
	public static final String UPDATE_PRODUCT_CART = "INSERT INTO `km_product_cart`(`uid`, `prodNo`, `price`, `discount`, `point`, `delivery`, `total`, `rdate`, `count`) "
													+ "SELECT ?, `prodNo`, `price`*?, `discount`, `point`, `delivery`, (`sellPrice`)*?+`delivery` , NOW(), ? "
													+ "FROM `km_product` "
													+ "WHERE prodNo = ?";
											
	//장바구니 상품삭제
	public static final String DELETE_PRODUCT_CART = "delete from `km_product_cart` where `cartNo` = ?";
	
	//장바구니 최종 가격
	public static final String SELECT_TOTAL_PRICE = "SELECT Count(b.`cartNo`), SUM(b.`price`), SUM(a.`sellPrice`*b.`count`), SUM(b.`delivery`), SUM(b.`point`), SUM(b.`total`) "
													+"FROM `km_product` AS a "
													+"JOIN `km_product_cart` AS b "
													+"ON a.prodNo=b.prodNo "
													+"WHERE `uid`=?";
}
