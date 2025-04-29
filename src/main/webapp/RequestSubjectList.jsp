<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수정되지 않은 강의 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: auto;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        .container {
            width: 80%;
            margin: auto;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>수정되지 않은 강의 목록</h2>

    <!-- subjectList가 requestScope에 있는지 확인하고 출력 -->
    <c:if test="${not empty requestScope.subjectList}">
        <table>
            <thead>
                <tr>
                    <th>과목 코드</th>
                    <th>과목 이름</th>
                    <th>과목 유형</th>
                    <th>개설 학년</th>
                    <th>분반</th>
                    <th>학점</th>
                    <th>교수명</th>
                    <th>현재 수강 인원</th>
                    <th>수강 가능 여부</th>
                </tr>
            </thead>
            <tbody>
                <!-- subjectList 반복 출력 -->
                <c:forEach var="subject" items="${requestScope.subjectList}">
                    <tr>
                        <td>${subject.subjectCode}</td>  <!-- VO 기준으로 subjectCode 출력 -->
                        <td>${subject.subjectName}</td>
                        <td>${subject.subjectType}</td>
                        <td>${subject.openGrade}</td>
                        <td>${subject.division}</td>
                        <td>${subject.credit}</td>
                        <td>${subject.professorName}</td>
                        <td>${subject.currentEnrollment}</td>
                        
                        <!-- 수강 가능 여부 처리 -->
						<td>
						${subject.isAvailable}
<%-- 						    <c:choose> --%>
<%-- 						        <c:when test="${subject.isAvailable == 1}"> --%>
<!-- 						            가능 -->
<%-- 						        </c:when> --%>
<%-- 						        <c:otherwise> --%>
<!-- 						            불가능 -->
<%-- 						        </c:otherwise> --%>
<%-- 						    </c:choose> --%>
						</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <!-- subjectList가 비어 있거나 null일 경우 -->
    <c:if test="${empty requestScope.subjectList}">
        <p>수정되지 않은 과목이 없습니다.</p>
    </c:if>
</div>

</body>
</html>
