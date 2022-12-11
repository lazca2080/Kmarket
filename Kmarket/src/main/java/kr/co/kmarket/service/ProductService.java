package kr.co.kmarket.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.kmarket.dao.ProductDAO;
import kr.co.kmarket.vo.ProductVO;

public enum ProductService {
	
	INSTANCE;
	private ProductDAO dao;
	private ProductService() { dao = new ProductDAO(); }
	
	public void insertProduct(ProductVO vo) {
		dao.insertProduct(vo);
	}
	
	
	// 서비스 로직
	
	public MultipartRequest fileUpload(HttpServletRequest req, String path) throws IOException {
		int maxSize = 1024 * 1024 * 10;
		return new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	}
	
	public void renameFile(ProductVO vo, String savePath) {
		
		// 확장자까지 길이
		int th1 = vo.getThumb1().lastIndexOf(".");
		int th2 = vo.getThumb2().lastIndexOf(".");
		int th3 = vo.getThumb3().lastIndexOf(".");
		int det = vo.getDetail().lastIndexOf(".");
		// 파일 이름까지 자르기
		String thumb1Ext = vo.getThumb1().substring(th1);
		String thumb2Ext = vo.getThumb2().substring(th2);
		String thumb3Ext = vo.getThumb3().substring(th3);
		String detailExt = vo.getDetail().substring(det);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String now = sdf.format(new Date());
		String newThumb1Name  = "admin"+thumb1Ext;
		String newThumb2Name  = "admin"+thumb2Ext;
		String newThumb3Name  = "admin"+thumb3Ext;
		String newDetailName = "admin"+detailExt;
		
		File fth1 = new File(savePath+"/"+vo.getThumb1());
		File fth2 = new File(savePath+"/"+vo.getThumb2());
		File fth3 = new File(savePath+"/"+vo.getThumb3());
		File dth  = new File(savePath+"/"+vo.getDetail());
		
		File newfth1 = new File(savePath+"/"+newThumb1Name);
		File newfth2 = new File(savePath+"/"+newThumb2Name);
		File newfth3 = new File(savePath+"/"+newThumb3Name);
		File newdth = new File(savePath+"/"+newDetailName);
		
		fth1.renameTo(newfth1);
		fth2.renameTo(newfth2);
		fth3.renameTo(newfth3);
		dth.renameTo(newdth);
	}
}

