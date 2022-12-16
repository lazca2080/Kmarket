package kr.co.kmarket.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket.service.IndexService;
import kr.co.kmarket.service.ProductService;
import kr.co.kmarket.vo.ProductVO;

@WebServlet("/product/cart.do")
public class CartController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private IndexService ser = IndexService.INSTANCE;

	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid");
		
		List<ProductVO> cart =service.selectProductCart(uid);
		
		req.setAttribute("cart", cart);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/cart.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sellPrice = req.getParameter("sellPrice");
		String delivery = req.getParameter("delivery");
		String total = sellPrice+delivery;
		
		
	}

}
