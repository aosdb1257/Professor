<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String contextPath = request.getContextPath();
    String jsonStr = request.getParameter("subjectList");
	System.out.println("전달받은 강의목록 객체 : " + jsonStr);
	// {"subjectCode":"RH1001","subjectName":"자료구조","subjectType":"전공","openGrade":2,"division":"A","credit":3,"professor":"홍길동","schedule":"월 1,2 / 공학관 101호","enrollment":"25/30"}
	
	// 디코딩시 오류
	//String searchDecoding = URLDecoder.decode(request.getParameter("subjectList"), "UTF-8");
	//System.out.println("전달받은 강의목록 객체 : " + searchDecoding);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>학원 강의계획서</title>
  <style>
    body {
      font-family: '맑은 고딕', sans-serif;
      padding: 20px;
    }

    .plan-container {
      width: 600px;
      border: 1px solid #000;
      padding: 20px;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }

    td {
      border: 1px solid #000;
      padding: 8px;
      vertical-align: top;
    }

    .label {
      width: 25%;
      background-color: #f5f5f5;
      font-weight: bold;
    }

    .section {
      height: 120px;
    }

    .bottom-buttons {
      text-align: center;
      margin-top: 20px;
    }

    .bottom-buttons button {
      padding: 10px 20px;
      font-size: 16px;
      margin: 0 10px;
      cursor: pointer;
    }

    input[type="text"], textarea {
      width: 100%;
      box-sizing: border-box;
      font-family: '맑은 고딕', sans-serif;
      font-size: 14px;
    }

    textarea {
      height: 100px;
      resize: none;
    }
  </style>
</head>
<body>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const subject = JSON.parse('<%= jsonStr %>');
    document.getElementById("subjectCode").value = subject.subjectCode;
    document.getElementById("subjectName").value = subject.subjectName;
    document.getElementById("professor").value = subject.professor;
    document.getElementById("professorId").value = subject.professorId || "";
    document.getElementById("open_grade").value = subject.openGrade + "학년";
  });
</script>

<div class="plan-container">
  <h2>강의계획서</h2>
  <form action="<%=contextPath%>/Professor/LecturePlanAdd.do" method="post">
    <input type="hidden" name="professorId" id="professorId">

    <table>
      <tr>
        <td class="label">교과명</td>
        <td><input type="text" id="subjectName" readonly /></td>
      </tr>
      <tr>
        <td class="label">과목코드</td>
        <td><input type="text" id="subjectCode" readonly /></td>
      </tr>
      <tr>
        <td class="label">강사명</td>
        <td><input type="text" id="professor" readonly /></td>
      </tr>
      <tr>
        <td class="label">강의기간</td>
        <td><input type="text" name="lecturePeriod" /></td>
      </tr>
      <tr>
        <td class="label">수강대상</td>
        <td><input type="text" id="open_grade" readonly /></td>
      </tr>
      <tr>
        <td class="label">주요내용</td>
        <td><input type="text" name="mainContent" /></td>
      </tr>
      <tr>
        <td class="label">강의목표</td>
        <td class="section"><textarea name="goal"></textarea></td>
      </tr>
      <tr>
        <td class="label">강의방법</td>
        <td class="section"><textarea name="method"></textarea></td>
      </tr>
      <tr>
        <td class="label">강의내용</td>
        <td class="section"><textarea name="content"></textarea></td>
      </tr>
      <tr>
        <td class="label">평가방법</td>
        <td class="section"><textarea name="evaluation"></textarea></td>
      </tr>
    </table>

    <div class="bottom-buttons">
      <button type="submit" formaction="<%=contextPath%>/Professor/LecturePlanAdd.do">등록하기</button>
      <button type="submit" formaction="<%=contextPath%>/Professor/LecturePlanUpdate.do">수정하기</button>
      <button type="submit" formaction="<%=contextPath%>/Professor/LecturePlanDelete.do">삭제하기</button>
    </div>
  </form>
</div>
</body>
</html>
