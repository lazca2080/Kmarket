package kr.co.kmarket.controller.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

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
		
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/prodImg");
		File Dir = new File(path);
		
		if(!Dir.exists()) {
			Dir.mkdirs();
		}
		MultipartRequest mr = service.fileUpload(req, path);
		
		req.setCharacterEncoding("UTF-8");
		String prodCate1 = mr.getParameter("prodCate1");
		String prodCate2 = mr.getParameter("prodCate2");
		String prodName  = mr.getParameter("prodName");
		String descript  = mr.getParameter("descript");
		String company   = mr.getParameter("company");
		String price     = mr.getParameter("price");
		String discount  = mr.getParameter("discount");
		String point     = mr.getParameter("point");
		String stock     = mr.getParameter("stock");
		String delivery  = mr.getParameter("delivery");
		String status    = mr.getParameter("status");
		String duty      = mr.getParameter("duty");
		String receipt   = mr.getParameter("receipt");
		String bizType   = mr.getParameter("bizType");
		String origin    = mr.getParameter("origin");
		String thumb1    = mr.getFilesystemName("thumb1");
		String thumb2    = mr.getFilesystemName("thumb2");
		String thumb3    = mr.getFilesystemName("thumb3");
		String detail    = mr.getFilesystemName("detail");
		String regip     = req.getRemoteAddr();
		
		ProductVO vo = new ProductVO();
		vo.setProdCate1(prodCate1);
		vo.setProdCate2(prodCate2);
		vo.setProdName(prodName);
		vo.setDescript(descript);
		vo.setCompany(company);
		vo.setPrice(price);
		vo.setDiscount(discount);
		vo.setPoint(point);
		vo.setStock(stock);
		vo.setDeilvery(delivery);
		vo.setStatus(status);
		vo.setDuty(duty);
		vo.setReceipt(receipt);
		vo.setBizType(bizType);
		vo.setOrigin(origin);
		vo.setRegip(regip);
		vo.setSeller("test");
		vo.setThumb1(thumb1);
		vo.setThumb2(thumb2);
		vo.setThumb3(thumb3);
		vo.setDetail(detail);
		
		service.insertProduct(vo);
		
		/*
		if(thumb1 != null && thumb2 != null && thumb3 != null && detail != null) {
			// 파일명 수정 ex)10-11-thumb1-img
			service.renameFile(vo, savePath);
		}
		*/
		
		resp.sendRedirect("/Kmarket/admin/index.do");
		
	}
}
