<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     

<c:set var="center" value="${requestScope.center}" />
<%-- 처음 클라이언트가 CarMain.jsp메인화면을 MVC패턴으로 요청했을때 중앙화면은 Center.jsp로 보이게 설정 --%>
<c:if test="${center == null}">
    <c:set var="center" value="ProfessorFirstCenter.jsp" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리 메인</title>
<style>
    html, body {
        margin: 0;
        padding: 0;
        height: 100%;
    }

    .container {
        display: flex;
        flex-direction: column;
        height: 100vh; /* 브라우저 전체 높이 */
        width: 100vw;  /* 브라우저 전체 너비 */
    }

    .top {
        height: 10%; /* 상단 영역 */
        width: 100%;
    }

    .center {
        height: 90%; /* 중앙 영역 */
        width: 100%;
    }

    iframe, .top iframe, .center iframe {
        width: 100%;
        height: 100%;
        border: none;
    }
    .center img {
    width: 100vw;    /* 뷰포트 너비를 100% 강제로 채움 */
    height: 100%;
    object-fit: cover;
    object-position: center;
    display: block;
	}
</style>
</head>
<body>
    <div class="container">
        <!-- 상단 영역 -->
        <div class="top">
            <jsp:include page="ProfessorTop.jsp" />
        </div>

        <!-- 중앙 영역 -->
        <div class="center">
            <jsp:include page="${center}" />
        </div>
    </div>
</body>
</html>
