<%@page import="Vo.LectureListVo"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	request.setCharacterEncoding("UTF-8"); // 한글 처리
	String contextPath = request.getContextPath();
	Vector<LectureListVo> list = (Vector<LectureListVo>) request.getAttribute("v");
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
			// 테스트용 출력 (안전하게 변경)
			System.out.println("첫 과목 코드: " + list.get(0).getSubjectCode());

			for (LectureListVo vo : list) {
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
							onclick="addLecturePlan('<%=vo%>')">강의계획서 등록
						</button>
					</td>
				</tr>
		<%
			}
		} else {
		%>
			<tr>
				<td colspan="9" style="text-align:center;">조회된 강의가 없습니다.</td>
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
