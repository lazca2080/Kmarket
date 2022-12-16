package kr.co.kmarket.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.kmarket.dao.ProductDAO;
import kr.co.kmarket.vo.CategoryVO;
import kr.co.kmarket.vo.ProductVO;

public enum ProductService {
	
	INSTANCE;
	private ProductDAO dao;
	private ProductService() { dao = new ProductDAO(); }
	
	public int insertProduct(ProductVO vo) {
		return dao.insertProduct(vo);
	}
	
	//Product list 목록 불러오기
	public List<ProductVO> selectProducts(int limiteStart, String cate1, String cate2) {
		return dao.selectProducts(limiteStart, cate1, cate2);
	}
	
	//Product 상품 하나 불러오기
	public ProductVO selectProduct(String prodNo) {
		return dao.selectProduct(prodNo);
	}
	
	public int selectCountTotal(String cate1, String cate2) {
		return dao.selectCountTotal(cate1, cate2);
	}
	
	//상품 네비게이션
	public CategoryVO selectCate(String cate1, String cate2) {
		return dao.selectCate(cate1, cate2);
	}
	
	//장바구니 목록
	public List<ProductVO> selectProductCart(String uid) {
		return dao.selectProductCart(uid);
	}
	
	public List<CategoryVO> selectCate(int cate) {
		return dao.selectCate(cate);
	}
	
	public Map<String, Object> selectCategory() {
		return dao.selectCategory();
	}
	
	public List<CategoryVO> selectCate1() {
		return dao.selectCate1();
	}
	
	public List<ProductVO> selectIndex() {
		return dao.selectIndex();
	}
	
	
	// 서비스 로직
	
	public MultipartRequest fileUpload(HttpServletRequest req, String path) throws IOException {
		int maxSize = 1024 * 1024 * 10;
		return new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	}
	
	public void renameFile(String name, String path, String fname, String prodCate1, String prodCate2) {
		
		// 확장자까지 길이 구하기
		int i = name.lastIndexOf(".");
		
		// 파일 이름까지 자르기 => ex) a.jpg -> .jpg
		String ext = name.substring(i);
		
		String newName  = prodCate1+"-"+prodCate2+"-"+fname+ext; // 뒤에 +ext 확장자가 없으면 확장자 없이 파일이 저장됩니다 따라서 붙여줍니다.
		// 해결?
		// prodNo를 넣은 이유는 유일한 PrimaryKey이여서 입니다. 이게 없어도 파일명이 중복되는일은 절대로 없지만... 깔끔해보이기 위해 넣었습니다.
		// name같은경우 첨부파일 삽입시 이름이 중복되면 ex) a.jpg, a.jpg, a.jpg, a.jpg => a.jpg, a1.jpg, a2.jpg, a3.jpg 로 자동변경됩니다.
		// 따라서 리스트 불러올때 경로가 중복되어 같은 사진 or 다른 사진이 불러와지는 일은 없습니다.
		
		File file1 = new File(path+"/"+name);
		File file2 = new File(path+"/"+newName);
		file1.renameTo(file2);
	}
	
	//마지막 페이지 값
	public int getLastPageNum(int total) {
		int lastPageNum = 0;
		
		if(total % 10 == 0){
   			lastPageNum = total / 10;
   		}else{
   			lastPageNum = total / 10 + 1;
   		}
		
		return lastPageNum;
	}
		
	//페이지 그룹 계산
	public int[] getpageGroupNum(int currentPage, int lastPageNum) {
		int pageGroupCurrent = (int)Math.ceil(currentPage / 10.0);
   		int pageGroupStart = (pageGroupCurrent - 1) * 10 + 1;
   		int pageGroupEnd = pageGroupCurrent * 10;
   		
   		if(pageGroupEnd > lastPageNum){
   			pageGroupEnd = lastPageNum;
   		}
   		
   		int[] result = {pageGroupStart, pageGroupEnd};
   		
   		return result;
	}
	
	//시작되는 페이지 그룹 번호
	public int getPageStartNum(int total, int currentPage) {
		int start = (currentPage - 1) * 10;
		return total - start;
	}
	
	//현재 페이지의 값 (첫화면 표시를 위해 1)
	public int getCurrentPage(String pg) {
		
		int currentPage = 1;
		
		if(pg != null){
   			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	
	//시작값
	public int getStartNum(int currentPage) {
		return(currentPage -1 ) * 10;
	}
}

