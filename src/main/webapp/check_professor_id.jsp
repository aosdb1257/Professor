<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Dao.DbcpBean" %>
<%
    String professorId = request.getParameter("professor_id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DbcpBean.getConnection();
        String sql = "SELECT user_id FROM User WHERE user_id = ? AND role = 'PROFESSOR'";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, professorId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            out.print("OK");
        } else {
            out.print("NOT_FOUND");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("ERROR");
    } finally {
        DbcpBean.close(conn, pstmt, rs);
    }
%>
