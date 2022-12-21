package kr.co.kmarket.controller.product;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket.service.IndexService;
import kr.co.kmarket.vo.CompleteVO;

@WebServlet("/product/complete.do")
public class CompleteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private IndexService ser = IndexService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Map<String, Object> cate = ser.selectCategory();
		req.setAttribute("cate", cate);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/complete.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String now = sdf.format(new Date());
		
		String uid = req.getParameter("uid");
		String ordNo        = now+uid;
		String ordCount     = req.getParameter("ordCount");
		String ordPrice     = req.getParameter("ordPrice");
		String ordDiscount  = req.getParameter("ordDiscount");
		String ordDelivery  = req.getParameter("ordDelivery");
		String ordsavePoint = req.getParameter("ordsavePoint");
		String ordusedPoint = req.getParameter("ordusedPoint");
		String ordTotPrice  = req.getParameter("ordTotPrice");
		String orderer      = req.getParameter("orderer");
		String hp 			= req.getParameter("hp");
		String zip 			= req.getParameter("zip");
		String addr1 		= req.getParameter("addr1");
		String addr2 		= req.getParameter("addr2");
		String payment 		= req.getParameter("payment");
		
		CompleteVO vo = new CompleteVO();
		vo.setOrdNo(ordNo);
		vo.setOrdUid(uid);
		vo.setOrdCount(ordCount);
		vo.setOrdPrice(ordPrice);
		vo.setOrdDiscount(ordDiscount);
		vo.setOrdDelivery(ordDelivery);
		vo.setOrdSavePoint(ordsavePoint);
		vo.setOrdUsedPoint(ordusedPoint);
		vo.setOrdTotPrice(ordTotPrice);
		vo.setOrdRecipHp(hp);
		vo.setOrdRecipName(orderer);
		vo.setOrdRecipZip(zip);
		vo.setOrdRecipAddr1(addr1);
		vo.setOrdRecipAddr2(addr2);
		vo.setOrdPayment(payment);
		vo.setOrdCompelete("1");
		
		
	}

}
