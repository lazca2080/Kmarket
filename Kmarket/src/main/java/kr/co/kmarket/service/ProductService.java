package kr.co.kmarket.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.kmarket.dao.ProductDAO;
import kr.co.kmarket.vo.ProductVO;

public enum ProductService {
	
	INSTANCE;
	private ProductDAO dao;
	private ProductService() { dao = new ProductDAO(); }
	
	public int insertProduct(ProductVO vo) {
		return dao.insertProduct(vo);
	}
	
	public List<ProductVO> selectProduct(String cate1, String cate2) {
		return dao.selectProduct(cate1, cate2);
	}
	
	// 서비스 로직
	
	public MultipartRequest fileUpload(HttpServletRequest req, String path) throws IOException {
		int maxSize = 1024 * 1024 * 10;
		return new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	}
	
	public void renameFile(String name, String path, String fname) {
		
		// 확장자까지 길이 구하기
		int i = name.lastIndexOf(".");
		
		// 파일 이름까지 자르기 => ex) a.jpg -> .jpg
		String ext = name.substring(i);
		
		String newName  = fname+ext; // 뒤에 +ext 확장자가 없으면 확장자 없이 파일이 저장됩니다 따라서 붙여줍니다.
		// 해결?
		// prodNo를 넣은 이유는 유일한 PrimaryKey이여서 입니다. 이게 없어도 파일명이 중복되는일은 절대로 없지만... 깔끔해보이기 위해 넣었습니다.
		// name같은경우 첨부파일 삽입시 이름이 중복되면 ex) a.jpg, a.jpg, a.jpg, a.jpg => a.jpg, a1.jpg, a2.jpg, a3.jpg 로 자동변경됩니다.
		// 따라서 리스트 불러올때 경로가 중복되어 같은 사진 or 다른 사진이 불러와지는 일은 없습니다.
		
		File file1 = new File(path+"/"+name);
		File file2 = new File(path+"/"+newName);
		file1.renameTo(file2);
	}
}

