package Container;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Professor")
public class ProfessorController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = response.getWriter();
		

		String action = request.getPathInfo();
		System.out.println("요청한 2단계 주소:" + action); 

		String nextPage = null;
		
		// 메인화면 요청 처리
		if(action.equals("/Main")) {
			
			nextPage = "/ProfessorMain.jsp";
		} else if(action.equals("/LectureList")) {
			
		}
		RequestDispatcher dispatche = request.getRequestDispatcher(nextPage);
		dispatche.forward(request, response);
	}
}
