<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
    

<c:set  var="center" value="${requestScope.center}" />    
<c:out value="${center}"/> <br>

<%-- 처음 클라이언트가 CarMain.jsp메인화면을 MVC패턴으로 요청했을때 중앙화면은 Center.jsp로 보이게 설정 --%>
<c:if test="${center == null}">
	<c:set  var="center"  value="FirstCenter.jsp" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<table width="1000" height="700">
			<!-- 홈페이지의 상단 영역 -->
			<tr>
				<td><jsp:include page="ProfessorTop.jsp"/></td>
			</tr>
			
			<!-- 홈페이지의 중앙 영역 -->
			<tr>
				<td height="500" align=""><jsp:include page="${center}"/>  </td>
			</tr>
			
		</table>
	</center>



</body>
</html>











