package kr.co.kmarket.db;

public class ProductSql {

	/* AWS mariaDB 버전이 낮아서 insert into `테이블명` set 사용불가
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
	
	public static final String insertProduct = "INSERT INTO `km_product` (`prodCate1`,`prodCate2`,`prodName`,`descript`,`company`,`price`,`discount`,`point`,`stock`,`delivery`,`status`,`duty`,`receipt`,`bizType`,`origin`,`ip`,`thumb1`,`thumb2`,`thumb3`,`detail`,`seller`,`rdate`)"
			+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW())";

	public static final String selectProdNo = "SELECT MAX(`prodNo`) FROM `km_product`";
	
}
