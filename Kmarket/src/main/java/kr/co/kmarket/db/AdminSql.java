package kr.co.kmarket.db;

public class AdminSql {

	//관리자 전체 조회
	public static final String selectProduct = "SELECT * FROM `km_product` AS a JOIN "
												+ "`km_member` AS b ON a.`seller` = b.`uid` "
												+ "WHERE `level` <= 7 "
												+ "ORDER BY `prodNo` DESC "
												+ "LIMIT ?,10 ";
	
	public static final String selectProduct1 = "SELECT * FROM `km_product` AS a JOIN "
												+ "`km_member` AS b ON a.`seller` = b.`uid` "
												+ "WHERE `level` <= 7 and `prodName` LIKE ? "
												+ "ORDER BY `prodNo` DESC "
												+ "LIMIT ?,10 ";
	
	public static final String selectProduct2 = "SELECT * FROM `km_product` AS a JOIN "
												+ "`km_member` AS b ON a.`seller` = b.`uid` "
												+ "WHERE `level` <= 7 and prodNo LIKE ? "
												+ "ORDER BY `prodNo` DESC "
												+ "LIMIT ?,10 ";
	
	public static final String selectProduct3 = "SELECT * FROM `km_product` AS a JOIN "
												+ "`km_member` AS b ON a.`seller` = b.`uid` "
												+ "WHERE `level` <= 7 and a.company LIKE ? "
												+ "ORDER BY `prodNo` DESC "
												+ "LIMIT ?,10 ";
	
	public static final String selectProduct4 = "SELECT * FROM `km_product` AS a JOIN "
												+ "`km_member` AS b ON a.`seller` = b.`uid` "
												+ "WHERE `level` <= 7 and seller LIKE ? "
												+ "ORDER BY `prodNo` DESC "
												+ "LIMIT ?,10 ";
	
	// 판매자상품만 조회
	public static final String selectProductss = "SELECT * FROM `km_product` WHERE `seller`=? "
			 									+ "order by `prodNo` desc LIMIT ?, 10";
	
	public static final String selectProductss1 = "SELECT * FROM `km_product` WHERE  `prodName` LIKE ? "
												+ "ORDER BY `prodNo` DESC LIMIT ?, 10";
	
	public static final String selectProductss2 = "SELECT * FROM `km_product` WHERE  `prodNo` LIKE ? "
												+ "ORDER BY `prodNo` DESC LIMIT ?, 10";

	public static final String selectProductss3 = "SELECT * FROM `km_product` WHERE  `company` LIKE ? "
												+ "ORDER BY `prodNo` DESC LIMIT ?, 10";

	public static final String selectProductss4 = "SELECT * FROM `km_product` WHERE  `seller` LIKE ? "
												+ "ORDER BY `prodNo` DESC LIMIT ?, 10";

	public static final String select_Product_Keyword = "SELECT `prodNo`,`prodName`,`company` FROM `km_product` "
													+ "WHERE `seller` = ? and "
													+ "(`prodName` LIKE ? OR "
													+ "`company` LIKE ? OR "
													+ "`prodNo` LIKE ?) "
													+ "ORDER BY `prodNo` DESC "
													+ "LIMIT ?,10";

	public static final String SELECT_ADMIN_LIST = "SELECT * FROM `km_product` WHERE `seller`=? "
												 + "order by `prodNo` desc LIMIT ?, 10";
	
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`prodNo`) FROM `km_product` "
												  + "where `seller`=? ";
	
	public static final String select_count_total_for_search1 = "SELECT COUNT(`prodNo`) FROM `km_product` AS a "
																+ "JOIN `km_member` AS b ON a.seller = b.uid "
																+ "WHERE `seller`= ? AND  "
																+ "(`prodName` LIKE ?) ";
	
	public static final String select_count_total_for_search2 = "SELECT COUNT(`prodNo`) FROM `km_product` AS a "
																+ "JOIN `km_member` AS b ON a.seller = b.uid "
																+ "WHERE `seller`= ? AND  "
																+ "(`prodNo` LIKE ?) ";
	
	public static final String select_count_total_for_search3 = "SELECT COUNT(`prodNo`) FROM `km_product` AS a "
																+ "JOIN `km_member` AS b ON a.seller = b.uid "
																+ "WHERE `seller`= ? AND  "
																+ "(a.company LIKE ?) ";
	
	public static final String select_count_total_for_search4 = "SELECT COUNT(`prodNo`) FROM `km_product` AS a "
																+ "JOIN `km_member` AS b ON a.seller = b.uid "
																+ "WHERE `seller`= ? AND  "
																+ "(`seller` LIKE ?) ";
	
	public static final String DELECT_PRODUCT = "delete from `km_product` where `prodNo`=? ";
}
