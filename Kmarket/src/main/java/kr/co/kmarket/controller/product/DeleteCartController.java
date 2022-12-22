package kr.co.kmarket.controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.kmarket.service.ProductService;

@WebServlet("/product/deleteCart.do")
public class DeleteCartController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cartNo = req.getParameter("totalNo");
		
		System.out.println("cartNo : "+cartNo);
		
		String cart[] = cartNo.split(",");
		
		List<String> totalNo = new ArrayList<>(); 
		
		int length = cart.length;
		
		for(int i = 0; i<length; i++) {
			System.out.println("cart : "+cart[i].replaceAll("[^\\d]", ""));
			totalNo.add(cart[i].replaceAll("[^\\d]", ""));
		}
		
		System.out.println("list : "+totalNo.get(0));
		
		//int result = service.deleteCart(totalNo);
		
		JsonObject json = new JsonObject();
		//json.addProperty("result", result);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
