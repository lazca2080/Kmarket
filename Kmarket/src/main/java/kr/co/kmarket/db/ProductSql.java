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
	
	public static final String insertProduct = "INSERT INTO `km_product` (`prodCate1`,`prodCate2`,`prodName`,`descript`,`company`,`price`,`discount`,`point`,`stock`,`delivery`,`status`,`duty`,`receipt`,`bizType`,`origin`,`ip`,`thumb1`,`thumb2`,`thumb3`,`detail`,`seller`,`sellPrice`,`rdate`)"
			+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW())";

	public static final String selectProdNo = "SELECT MAX(`prodNo`) FROM `km_product`";
	
	public static final String SELECT_PRODUCTS = "SELECT * FROM `km_product` WHERE `prodCate1`=? and `prodCate2`=?";
}
