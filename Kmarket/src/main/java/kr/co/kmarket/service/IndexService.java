package kr.co.kmarket.service;

import java.util.List;

import kr.co.kmarket.dao.IndexDAO;
import kr.co.kmarket.vo.CategoryVO;

public enum IndexService {
	
	INSTANCE;
	private IndexDAO dao;
	private IndexService() { dao = new IndexDAO(); }
	
	public List<CategoryVO> selectCate(int cate) {
		return dao.selectCate(cate);
	}
	
	public void selectCategory() {
		dao.selectCategory();
	}
	
	public List<CategoryVO> selectCate1() {
		return dao.selectCate1();
	}
}
