package kr.co.kmarket.controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.kmarket.service.IndexService;
import kr.co.kmarket.service.ProductService;
import kr.co.kmarket.vo.ProductVO;

@WebServlet("/product/cart.do")
public class CartController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private IndexService ser = IndexService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid");
		//String prodNo = req.getParameter("prodNo");
		
		logger.info(uid);
		//logger.info(prodNo);
		
		List<ProductVO> cart =service.selectProductCart(uid);
		req.setAttribute("cart", cart);
		
		Map<String, Object> cate = ser.selectCategory();
		req.setAttribute("cate", cate);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/cart.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid");
		
		logger.info("post uid : "+uid);
		
		ProductVO vo = service.selectTotalPrice(uid);
		
		logger.debug("vo : "+vo);
		
		JsonObject json = new JsonObject();
		json.addProperty("totalCount", vo.getTotalcount());
		json.addProperty("costPrice", vo.getCostPrice());
		json.addProperty("totalSalePrice", vo.getCostPrice() - vo.getTotalSalePrice());
		json.addProperty("totalDelivery", vo.getTotalDelivery());
		json.addProperty("totalPoint", vo.getTotalPoint());
		json.addProperty("totalPrice", vo.getTotalPrice());
		
		logger.debug("costprice : "+vo.getCostPrice());
		
		HttpSession session = req.getSession();
		session.setAttribute("totalCount", vo.getTotalcount());
		session.setAttribute("costPrice", vo.getCostPrice());
		session.setAttribute("totalSalePrice", vo.getCostPrice() - vo.getTotalSalePrice());
		session.setAttribute("totalDelivery", vo.getTotalDelivery());
		session.setAttribute("totalPoint", vo.getTotalPoint());
		session.setAttribute("totalPrice", vo.getTotalPrice());
		
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}

}
