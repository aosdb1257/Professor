<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8"); // 한글 처리
String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 등록</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			margin: 30px;
		}
		
		table {
			width: 800px;
			border-collapse: collapse;
			margin: auto;
			background-color: #f9f9f9;
		}
		
		th, td {
			padding: 12px;
			border: 1px solid #ddd;
		}
		
		th {
			background-color: #2c3e50;
			color: white;
			text-align: left;
		}
		
		input[type="text"], input[type="number"], select {
			padding: 8px;
			margin-top: 5px;
			width: 95%;
		}
		
		.day-time-row {
			display: flex;
			align-items: center;
			margin-bottom: 8px;
		}
		
		.day-time-row select {
			margin-right: 10px;
			padding: 5px;
			width: 150px;
		}
		
		.day-time-row button {
			margin-left: 10px;
			padding: 8px 16px;
			height: 40px;
			cursor: pointer;
			background-color: #e74c3c;
			color: white;
			border: none;
			border-radius: 4px;
		}
		
		.add-button {
			margin-top: 10px;
			padding: 8px 16px;
			background-color: #3498db;
			color: white;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		
		input[type="submit"] {
			padding: 10px 20px;
			margin-top: 20px;
			cursor: pointer;
		}
		
		.center {
			text-align: center;
		}
		.input-with-button {
		    display: flex;
		    align-items: center;
		}
		
		.input-with-button input {
		    flex: 1; /* input은 남은 영역 모두 차지 */
		}
		
		.input-with-button button {
		    margin-left: 10px; /* 버튼과 input 사이 약간의 간격 */
		    padding: 8px 16px;
		    cursor: pointer;
		}
	</style>
	<script>
        let isSubjectCodeChecked = true;
        let isProfessorIdChecked = true;

        function validateForm() {
            if (!isSubjectCodeChecked) {
                alert("과목 코드 중복 체크를 완료하세요!");
                return false;
            }
            if (!isProfessorIdChecked) {
                alert("교수 ID 존재 여부를 확인하세요!");
                return false;
            }

            const startTimes = document.getElementsByName("start_time[]");
            const endTimes = document.getElementsByName("end_time[]");
            for (let i = 0; i < startTimes.length; i++) {
                const start = parseInt(startTimes[i].value);
                const end = parseInt(endTimes[i].value);

                if (isNaN(start) || isNaN(end)) {
                    alert(`${i + 1}번째 요일/시간이 비어 있습니다.`);
                    return false;
                }
                if (start > end) {
                    alert(`${i + 1}번째 시작 교시가 종료 교시보다 늦습니다.`);
                    return false;
                }
            }
            return true;
        }

        function addDayTimeRow() {
            const container = document.getElementById('dayTimeContainer');
            const row = document.createElement('div');
            row.className = 'day-time-row';

            row.innerHTML = `
                <select name="day[]" required>
                    <option value="">요일 선택</option>
                    <option value="월">월</option>
                    <option value="화">화</option>
                    <option value="수">수</option>
                    <option value="목">목</option>
                    <option value="금">금</option>
                </select>
                <select name="start_time[]" required>
                    <option value="">시작 교시</option>
                    <option value="1">1교시</option>
                    <option value="2">2교시</option>
                    <option value="3">3교시</option>
                    <option value="4">4교시</option>
                    <option value="5">5교시</option>
                    <option value="6">6교시</option>
                    <option value="7">7교시</option>
                    <option value="8">8교시</option>
                    <option value="9">9교시</option>
                </select>
                <select name="end_time[]" required>
                    <option value="">종료 교시</option>
                    <option value="1">1교시</option>
                    <option value="2">2교시</option>
                    <option value="3">3교시</option>
                    <option value="4">4교시</option>
                    <option value="5">5교시</option>
                    <option value="6">6교시</option>
                    <option value="7">7교시</option>
                    <option value="8">8교시</option>
                    <option value="9">9교시</option>
                </select>
                <button type="button" onclick="removeDayTimeRow(this)">삭제</button>
            `;
            container.appendChild(row);
        }

        function removeDayTimeRow(button) {
            if (confirm('정말 삭제하시겠습니까?')) {
                button.parentElement.remove();
            }
        }
    </script>
</head>

<body>
	<h2 style="text-align: center;">과목 등록</h2>
	<form action="<%=contextPath%>/professor/lecturecreate" method="post"
		onsubmit="return validateForm();">
		<table>
			<tr>
				<th>항목</th>
				<th>입력</th>
			</tr>

			<tr>
				<td>과목 코드</td>
				<td>
					<div class="input-with-button">
						<input type="text" id="subject_code" name="subject_code" required>
						<button type="button" onclick="checkSubjectCode()">중복 체크</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>과목 이름</td>
				<td><input type="text" name="subject_name" required></td>
			</tr>
			<tr>
				<td>과목 유형</td>
				<td><select name="subject_type" required>
						<option value="전공">전공</option>
						<option value="교양">교양</option>
				</select></td>
			</tr>
			<tr>
				<td>개설 학년</td>
				<td><select name="open_grade" required>
						<option value="1">1학년</option>
						<option value="2">2학년</option>
						<option value="3">3학년</option>
						<option value="4">4학년</option>
				</select></td>
			</tr>
			<tr>
				<td>분반</td>
				<td><input type="text" name="division"></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="number" name="credit" required></td>
			</tr>
			<tr>
				<td>담당 교수 ID</td>
				<td>
					<div class="input-with-button">
						<input type="number" id="professor_id" name="professor_id"
							required>
						<button type="button" onclick="checkProfessorId()">교수 확인</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>담당 교수 이름</td>
				<td><input type="text" name="professor_name" required></td>
			</tr>

			<tr>
				<td>개설 요일/시간</td>
				<td>
					<div id="dayTimeContainer"></div>
					<div class="center">
						<button type="button" class="add-button" onclick="addDayTimeRow()">요일/시간
							추가</button>
					</div>
				</td>
			</tr>

			<tr>
				<td>수강 정원</td>
				<td><input type="number" name="capacity" required></td>
			</tr>
		</table>

		<div class="center">
			<input type="hidden" name="current_enrollment" value="0"> <input
				type="submit" value="과목 등록">
		</div>
	</form>
</body>
</html>
