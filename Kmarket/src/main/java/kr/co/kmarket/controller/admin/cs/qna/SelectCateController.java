package kr.co.kmarket.controller.admin.cs.qna;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.google.gson.Gson;

import kr.co.kmarket.service.CsService;
import kr.co.kmarket.vo.CsVO;

@WebServlet("/admin/cs/qna/select.do")
public class SelectCateController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CsService service = CsService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		logger.info("doGet");
		
		resp.setContentType("text/html;charset=UTF-8");
		
		String cateType1 = req.getParameter("cateType1");
		String cateType2 = req.getParameter("cateType2");
		
		logger.debug("cateType1 : " + cateType1);
		logger.debug("cateType2 : " + cateType2);
		
		String jsonData = null;
		Gson gson = new Gson();
		
//		if(cateType1 != null && cateType2 == null) {
//			logger.debug("here1 controller");
//			List<CsVO> vo = service.selectArticlesCateType(cateType1);
//			jsonData = gson.toJson(vo);
//			
//		}else 
		if(cateType1 != null && cateType2 != null) {
			logger.debug("here1 controller");
			List<CsVO> vo = service.selectArticlesCateType2(cateType1, cateType2);
			jsonData = gson.toJson(vo);
		}
		
		logger.debug("here3 controller: " + jsonData);
		PrintWriter writer = resp.getWriter();
		writer.print(jsonData);
		
		
		
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	
}
