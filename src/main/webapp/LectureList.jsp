<%@page import="java.net.URLEncoder"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="Vo.LectureListVo"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	request.setCharacterEncoding("UTF-8"); // 한글 처리
	String contextPath = request.getContextPath();
	Vector<LectureListVo> list = (Vector<LectureListVo>) request.getAttribute("v");
	Gson gson = new Gson();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록</title>
</head>
<body>
	<h2>강의 목록</h2>
	<table border="1" cellpadding="8" cellspacing="0">
		<tr>
			<th>과목코드</th>
			<th>과목명</th>
			<th>이수구분</th>
			<th>개설학년</th>
			<th>분반</th>
			<th>학점</th>
			<th>교수</th>
			<th>시간/장소</th>
			<th>신청/정원</th>
			<th>강의계획서</th>
		</tr>

		<%
		if (list != null && !list.isEmpty()) {

			for (LectureListVo vo : list) {
			String json = gson.toJson(vo); // 자바 객체 -> JSON 문자열
			System.out.println("자바 객체 -> JSON 문자열 : " + json);
			String encodeJson = URLEncoder.encode(json, "utf-8"); // JSON 문자열 -> URL 안전한 문자열
			System.out.println("JSON 문자열 -> URL 안전한 문자열 : " + encodeJson);
		%>
				<tr>
					<td><%=vo.getSubjectCode()%></td>
					<td><%=vo.getSubjectName()%></td>
					<td><%=vo.getSubjectType()%></td>
					<td><%=vo.getOpenGrade()%></td>
					<td><%=vo.getDivision()%></td>
					<td><%=vo.getCredit()%></td>
					<td><%=vo.getProfessor()%></td>
					<td><%=vo.getSchedule()%></td>
					<td><%=vo.getEnrollment()%></td>
					<td>
						<button id="LecturePlanBtn" 
							onclick="addLecturePlan('<%= encodeJson %>')">강의계획서 등록
						</button>
					</td>
				</tr>
		<%
			}
		} else {
		%>
			<tr>
				<td colspan="10" style="text-align:center;">조회된 강의가 없습니다.</td>
			</tr>
		<%
		}
		%>
	</table>
	<script>
		function addLecturePlan(subjectList) {
		    const url = "<%=contextPath%>/LecturePlan/LecturePlan.jsp?subjectList=" + subjectList;
	
		    window.open(url, 'lecturePlanPopup', "width=700,height=1000,left=200,top=500,resizable=no,scrollbars=yes");
		}
	</script>
</body>
</html>
