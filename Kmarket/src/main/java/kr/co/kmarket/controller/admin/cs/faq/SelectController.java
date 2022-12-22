package kr.co.kmarket.controller.admin.cs.faq;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

import kr.co.kmarket.service.CsService;
import kr.co.kmarket.vo.CsVO;

@WebServlet("/admin/cs/faq/select.do")
public class SelectController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private CsService service = CsService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("selectControll doget");
		
		resp.setContentType("text/html;charset=UTF-8");
		
		String cateType1 = req.getParameter("cateType1");
		String cateType2 = req.getParameter("cateType2");
		int 	start 	 = 0;
		
		logger.debug("cateType1 : "+cateType1);
		logger.debug("cateType2 : "+cateType2);
		
		String jsonData = null;
		Gson gson = new Gson();
		
		if(cateType1 != null && cateType2 != null) {
			logger.debug("selectcateType...");
			List<CsVO> vo= service.selectArticlesFaqCateType2(cateType1,cateType2,start);
			jsonData = gson.toJson(vo);
		}
		
		logger.debug("select jsonDate : "+jsonData);
		PrintWriter writer = resp.getWriter();
		writer.print(jsonData);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
