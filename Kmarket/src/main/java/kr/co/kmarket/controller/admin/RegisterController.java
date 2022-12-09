package kr.co.kmarket.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket.service.ProductService;
import kr.co.kmarket.vo.ProductVO;

@WebServlet("/admin/register.do")
public class RegisterController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;

	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cate1    = req.getParameter("cate1");
		String cate2    = req.getParameter("cate2");
		String name     = req.getParameter("name");
		String text     = req.getParameter("text");
		String company  = req.getParameter("company");
		String price    = req.getParameter("price");
		String dis      = req.getParameter("dis");
		String point    = req.getParameter("point");
		String stock    = req.getParameter("stock");
		String deli     = req.getParameter("deli");
		String quality  = req.getParameter("quality");
		String vat      = req.getParameter("vat");
		String receipt  = req.getParameter("receipt");
		String business = req.getParameter("business");
		String origin   = req.getParameter("origin");
		String fname1   = req.getParameter("fname1");
		String fname2   = req.getParameter("fname2");
		String fname3   = req.getParameter("fname3");
		String fname4   = req.getParameter("fname4");
		String regip    = req.getRemoteAddr();
		
		ProductVO vo = new ProductVO();
		vo.setCate1(cate1);
		vo.setCate2(cate2);
		vo.setName(name);
		vo.setText(text);
		vo.setCompany(company);
		vo.setPrice(price);
		vo.setDis(dis);
		vo.setPoint(point);
		vo.setStock(stock);
		vo.setDeli(deli);
		vo.setQuality(quality);
		vo.setVat(vat);
		vo.setReceipt(receipt);
		vo.setBusiness(business);
		vo.setOrigin(origin);
		vo.setFname1("1");
		vo.setFname2("1");
		vo.setFname3("1");
		vo.setFname4("1");
		vo.setRegip(regip);
		
		service.insertProduct(vo);
		
		
		
		
	}
}
