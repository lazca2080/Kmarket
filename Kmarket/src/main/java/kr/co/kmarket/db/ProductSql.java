package kr.co.kmarket.db;

public class ProductSql {

	public static final String insertProduct = "INSERT INTO `km_product` SET"
			+ "`prodCate1`=?"
			+ "`prodCate2`=?"
			+ "`descript`=?"
			+ "`company`=?"
			+ "`price`=?"
			+ "`discount`=?"
			+ "`point`=?"
			+ "`stock`=?"
			+ "`sold`=?"
			+ "`delivery`=?"
			+ "`thumb1`=?"
			+ "`thumb2`=?"
			+ "`thumb3`=?"
			+ "`status`=?"
			+ "`duty`=?"
			+ "`receipt`=?"
			+ "`bizType`=?"
			+ "`origin`=?"
			+ "`ip`=?"
			+ "`rdate`=NOW()";
	
	
}
