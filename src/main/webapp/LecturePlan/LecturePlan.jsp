<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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

    .bottom-sign {
      text-align: center;
      margin-top: 40px;
    }
  </style>
</head>
<body>
  <div class="plan-container">
    <h2>강의계획서</h2>
    <table>
      <tr>
        <td class="label">교과명</td>
        <td>여기</td>
      </tr>
      <tr>
        <td class="label">강사명</td>
        <td> </td>
      </tr>
      <tr>
        <td class="label">강의기간</td>
        <td> </td> <!-- 빈칸 유지 -->
      </tr>
      <tr>
        <td class="label">수강대상</td>
        <td> </td>
      </tr>
      <tr>
        <td class="label">주요내용</td>
        <td> </td>
      </tr>
    </table>

    <table>
      <tr>
        <td class="label">강의목표</td>
        <td class="section"> </td>
      </tr>
      <tr>
        <td class="label">강의방법</td>
        <td class="section"> </td>
      </tr>
      <tr>
        <td class="label">강의내용</td>
        <td class="section"> </td>
      </tr>
      <tr>
        <td class="label">평가방법</td>
        <td class="section"> </td>
      </tr>
    </table>

    <div class="bottom-sign">서울대학교</div>
  </div>
</body>
</html>
