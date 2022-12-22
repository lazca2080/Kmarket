package kr.co.kmarket.controller.admin.cs.notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.kmarket.service.CsService;
import kr.co.kmarket.vo.CsVO;

@WebServlet("/admin/cs/notice/delete.do")
public class DeleteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private CsService service = CsService.INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		logger.info("doGet");
		
		String no = req.getParameter("no");
		
		logger.info("no: " + no);
		
		int result = service.deleteArticle(no);
		logger.info("result:" + result);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		logger.info("doPost");
		
		//JSON.stringify를 통해 받은 데이터 (문자 형태)
		String chk = req.getParameter("chk_arr");
		logger.info("chk: " + chk);
		
		// 문자열을 ,로 나눈 후 저장
		String arrChks[] = chk.split(",");
		
		// 길이 구하기
		int length = arrChks.length;
		
		// 한 번에 저장할 List 생성
		List<String> chk_arr = new ArrayList<>();

		for (int i=0; i<length; i++) {
			System.out.println("arrChks: "+arrChks[i]);	//"[18","17]"
			chk_arr.add(arrChks[i].replaceAll("[^\\d]", ""));						// 숫자를 제외한 문자를 없앤 후 저장
		}
		
		System.out.println("list: "+chk_arr.get(0));
		//진행 중
		
		
//		int size = arrChk.length;
//		
//		for(int i=0; i<size; i++) {
//			System.out.println("JSP에서 받은 배열: " + arrChk);
//		}
		
		
		
		
	}
}
