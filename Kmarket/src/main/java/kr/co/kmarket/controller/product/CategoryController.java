package kr.co.kmarket.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket.service.ProductService;
import kr.co.kmarket.vo.CategoryVO;

@WebServlet("/product/category.do")
public class CategoryController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE; 
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<CategoryVO> category = service.selectCategory();
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
