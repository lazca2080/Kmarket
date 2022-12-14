package kr.co.kmarket.db;

public class AdminSql {

	public static final String selectProduct = "SELECT * FROM `km_product`";
	
	public static final String selectProductss = "SELECT * FROM `km_product` WHERE `seller`=?";
	
}
