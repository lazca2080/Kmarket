package kr.co.kmarket.vo;

public class ProductVO {

	private String cate1;
	private String cate2;
	private String name;
	private String text;
	private String company;
	private int price;
	private int dis;
	private int point;
	private int stock;
	private int deli;
	private String quality;
	private String vat;
	private String receipt;
	private String business;
	private String origin;
	private String fname1;
	private String fname2;
	private String fname3;
	private String fname4;
	
	private String regip;
	
	public String getRegip() {
		return regip;
	}
	public void setRegip(String regip) {
		this.regip = regip;
	}
	
	public String getCate1() {
		return cate1;
	}
	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}
	public String getCate2() {
		return cate2;
	}
	public void setCate2(String cate2) {
		this.cate2 = cate2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setPrice(String price) {
		this.price = Integer.parseInt(price);
	}
	public int getDis() {
		return dis;
	}
	public void setDis(int dis) {
		this.dis = dis;
	}
	public void setDis(String dis) {
		this.dis = Integer.parseInt(dis);
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public void setPoint(String point) {
		this.point = Integer.parseInt(point);
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public void setStock(String stock) {
		this.stock = Integer.parseInt(stock);
	}
	public int getDeli() {
		return deli;
	}
	public void setDeli(int deli) {
		this.deli = deli;
	}
	public void setDeli(String deli) {
		this.deli = Integer.parseInt(deli);
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getVat() {
		return vat;
	}
	public void setVat(String vat) {
		this.vat = vat;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getFname1() {
		return fname1;
	}
	public void setFname1(String fname1) {
		this.fname1 = fname1;
	}
	public String getFname2() {
		return fname2;
	}
	public void setFname2(String fname2) {
		this.fname2 = fname2;
	}
	public String getFname3() {
		return fname3;
	}
	public void setFname3(String fname3) {
		this.fname3 = fname3;
	}
	public String getFname4() {
		return fname4;
	}
	public void setFname4(String fname4) {
		this.fname4 = fname4;
	}
	
	
	
	
	
	
}
