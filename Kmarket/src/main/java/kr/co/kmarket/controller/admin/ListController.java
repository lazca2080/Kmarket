package kr.co.kmarket.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket.service.AdminService;
import kr.co.kmarket.service.MemberService;
import kr.co.kmarket.vo.MemberVO;
import kr.co.kmarket.vo.ProductVO;

@WebServlet("/admin/list.do")
public class ListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private AdminService service = AdminService.INSTANCE;
	private MemberService services = MemberService.INSTANCE;

	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*
		ProductVO products = service.selectProducts();
		req.setAttribute("products", products);
		*/
		String uid = req.getParameter("uid");
		String cate = req.getParameter("cate");
		String pg = req.getParameter("pg");
		String group = req.getParameter("group");
		//String search = req.getParameter("serarch");
		
		List<ProductVO> Product = service.selectProductss(uid);
		req.setAttribute("Product", Product);
		
		
		/*List<ProductVO> product = null;
		if(search == null) {
			product = service.selectProductss(uid);
		}else {
			product = service.selectProductKeyword(uid, search);
		}
		*/
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
