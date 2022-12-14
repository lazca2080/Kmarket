package kr.co.kmarket.controller.cs.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.service.CsService;
import kr.co.kmarket.vo.CsVO;

@WebServlet("/cs/qna/write.do")
public class WriteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private CsService service = CsService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		logger.info("WriteController doGet...");
		
		String cate = req.getParameter("cate");
		String cateType1 = req.getParameter("cateType1");
		String cateType2 = req.getParameter("cateType2");
		
		req.setAttribute("cate", cate);
		req.setAttribute("cateType1", cateType1);
		req.setAttribute("cateType2", cateType2);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/qna/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		logger.info("WriteController doPost...");
		
		String cate = req.getParameter("cate");
		String cateType1 = req.getParameter("cateType1");
		String cateType2 = req.getParameter("cateType2");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String uid = req.getParameter("uid");
		String regip = req.getParameter("regip");
		
		CsVO vo =  new CsVO();
		vo.setCate(cate);
		vo.setCateType1(cateType1);
		vo.setCateType2(cateType2);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setUid(uid);
		vo.setRegip(regip);
		
		int parent = service.insertArticle(vo);
				
		resp.sendRedirect("/Kmarket/cs/qna/list.do?cate="+cate+"&cateType1="+cateType1+"&catetType2="+cateType2);
	}
}
