package Container;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.ProfessorService;
import Vo.LectureListVo;

@WebServlet("/Professor/*")
public class ProfessorController extends HttpServlet {
	private ProfessorService professorService;

	@Override
	public void init() throws ServletException {
		professorService = new ProfessorService();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter pw = response.getWriter();

		String action = request.getPathInfo();
		System.out.println("요청한 2단계 주소:" + action);

		String nextPage = null;
		
		// 로그인 중인 교수 id 를 얻기 위해
		HttpSession session = request.getSession(false); // false는 세션이 없으면 새로운 세션을 만들지 않음


		// 메인화면 요청 처리
		if (action.equals("/Main")) {

			nextPage = "/ProfessorMain.jsp";
		} else if (action.equals("/LectureList.do")) {
			String id = (String)session.getAttribute("id");
			Vector<LectureListVo> LectureListV = ProfessorService.getAllLectureList(id);
			request.setAttribute("v", LectureListV);
			
			request.setAttribute("center", "LectureList.jsp");
			nextPage = "/ProfessorMain.jsp";
		}
		RequestDispatcher dispatche = request.getRequestDispatcher(nextPage);
		dispatche.forward(request, response);
	}
}
