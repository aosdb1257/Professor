package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import Vo.LectureListVo;
import Vo.LecturePlanVo;

public class ProfessorDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 교수 ID에 해당하는 강의 리스트를 조회
	public Vector<LectureListVo> getAllLectureList(String professorId) {
		Vector<LectureListVo> list = new Vector<>();

		String sql = "SELECT subject_code, subject_name, subject_type, open_grade, division, credit, "
				+ "professor_id, professor_name, schedule, current_enrollment " + "FROM subject WHERE professor_id = ?";

		try {
			conn = DbcpBean.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "6");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				LectureListVo vo = new LectureListVo();
				vo.setSubjectCode(rs.getString("subject_code"));
				vo.setSubjectName(rs.getString("subject_name"));
				vo.setSubjectType(rs.getString("subject_type"));
				vo.setOpenGrade(rs.getInt("open_grade"));
				vo.setDivision(rs.getString("division"));
				vo.setCredit(rs.getInt("credit"));
				vo.setProfessorId(rs.getInt("professor_id"));
				vo.setProfessor(rs.getString("professor_name"));
				vo.setSchedule(rs.getString("schedule"));
				vo.setEnrollment(rs.getString("current_enrollment"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbcpBean.close(conn, pstmt, rs);
		}

		return list;
	}

	public boolean addLecturePlan(LecturePlanVo planvo) {
		String sql = "INSERT INTO lecture_plan (subject_code, subject_name, professor_id, professor_name, lecture_period, target_students, main_content, goal, method, content, evaluation) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			conn = DbcpBean.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, planvo.getSubjectCode());
			pstmt.setString(2, planvo.getSubjectName());
			pstmt.setString(3, planvo.getProfessorId());
			pstmt.setString(4, planvo.getProfessorName());
			pstmt.setString(5, planvo.getLecturePeriod());
			pstmt.setString(6, planvo.getTargetStudents());
			pstmt.setString(7, planvo.getMainContent());
			pstmt.setString(8, planvo.getGoal());
			pstmt.setString(9, planvo.getMethod());
			pstmt.setString(10, planvo.getContent());
			pstmt.setString(11, planvo.getEvaluation());

			int result = pstmt.executeUpdate(); // 성공 = 1, 실패 = 0
			return result > 0; // 성공적으로 삽입되었으면 true 반환
		} catch (Exception e) {
			System.out.println("강의계획 추가 중 오류 발생");
			e.printStackTrace();
		} finally {
			DbcpBean.close(conn, pstmt);
		}
		return false;
	}
}
