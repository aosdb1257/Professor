package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import Vo.LectureListVo;

public class ProfessorDao {
	Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    // 교수 ID에 해당하는 강의 리스트를 조회
    public Vector<LectureListVo> getAllLectureList(String professorId) {
        Vector<LectureListVo> list = new Vector<>();

        String sql = "SELECT subject_code, subject_name, subject_type, open_grade, division, credit, "
                   + "professor, schedule, enrollment " 
                   + "FROM subject WHERE professor_id = ?";

        try {
        	conn = DbcpBean.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "P001");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                LectureListVo vo = new LectureListVo();
                vo.setSubjectCode(rs.getString("subject_code"));
                vo.setSubjectName(rs.getString("subject_name"));
                vo.setSubjectType(rs.getString("subject_type"));
                vo.setOpenGrade(rs.getInt("open_grade"));
                vo.setDivision(rs.getString("division"));
                vo.setCredit(rs.getInt("credit"));
                vo.setProfessor(rs.getString("professor")); 
                vo.setSchedule(rs.getString("schedule"));
                vo.setEnrollment(rs.getString("enrollment"));
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbcpBean.close(conn, pstmt, rs);
        }

        return list;
    }
}
