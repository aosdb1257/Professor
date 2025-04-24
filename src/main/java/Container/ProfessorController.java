package Container;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import Vo.LecturePlanVo;

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
        
		LecturePlanVo planvo = new LecturePlanVo();
		
		// 로그인 중인 교수 id 를 얻기 위해
		HttpSession session = request.getSession(false); // false는 세션이 없으면 새로운 세션을 만들지 않음


		// 메인화면 요청 처리
		if (action.equals("/Main")) {

			nextPage = "/ProfessorMain.jsp";
		} 
		// 강의목록 조회
		else if (action.equals("/LectureList.do")) {
			String id = (String)session.getAttribute("id");
			Vector<LectureListVo> LectureListV = ProfessorService.getAllLectureList(id);
			request.setAttribute("v", LectureListV);
			
			request.setAttribute("center", "LectureList.jsp");
			nextPage = "/ProfessorMain.jsp";
		}
		// 강의계획서 등록
		else if (action.equals("/LecturePlanAdd.do")) {
			planvo.setSubjectCode(request.getParameter("subjectCode"));
	        planvo.setProfessorId(request.getParameter("professorId"));
	        planvo.setProfessorName(request.getParameter("professor"));
	        planvo.setLecturePeriod(request.getParameter("lecturePeriod"));
	        planvo.setTargetStudents(request.getParameter("open_grade"));
	        planvo.setMainContent(request.getParameter("mainContent"));
	        planvo.setGoal(request.getParameter("goal"));
	        planvo.setMethod(request.getParameter("method"));
	        planvo.setContent(request.getParameter("content"));
	        planvo.setEvaluation(request.getParameter("evaluation"));
		    
	        boolean result = professorService.addLecturePlan(planvo);

		    if (result) {
		        nextPage = "/Professor/Main"; // 성공 시 이동할 페이지
		    } else {
		        pw.println("<script>alert('등록 실패');history.back();</script>");
		        return;
		    }
			
		}
		/*
		// 강의계획서 수정
		else if (action.equals("/LecturePlanUpdate.do")) {
			
		}
		// 강의계획서 삭제
		else if (action.equals("/LecturePlanDelete.do")) {
			
		}
		*/
		RequestDispatcher dispatche = request.getRequestDispatcher(nextPage);
		dispatche.forward(request, response);
	}
}
